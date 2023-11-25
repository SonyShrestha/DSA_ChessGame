#include <postgres.h>

#include "utils/builtins.h"
#include "libpq/pqformat.h"

#include "smallchesslib.h"

PG_MODULE_MAGIC;

#define DatumGetBoardP(X) ((SCL_Board *)DatumGetPointer(X))
#define BoardPGetDatum(X) PointerGetDatum(X)
#define PG_GETARG_BOARD_P(n) DatumGetBoardP(PG_GETARG_DATUM(n))
#define PG_RETURN_BOARD_P(x) return BoardPGetDatum(x)

#define DatumGetGameP(X) ((SCL_Record *)DatumGetPointer(X))
#define GamePGetDatum(X) PointerGetDatum(X)
#define PG_GETARG_GAME_P(n) DatumGetGameP(PG_GETARG_DATUM(n))
#define PG_RETURN_GAME_P(x) return GamePGetDatum(x)

PG_FUNCTION_INFO_V1(chess_board_in);
Datum chess_board_in(PG_FUNCTION_ARGS)
{
    char *str = PG_GETARG_CSTRING(0);

    SCL_Board *board = palloc(sizeof(SCL_Board));

    if (SCL_boardFromFEN(board, str) == 0)
        ereport(ERROR, (errcode(ERRCODE_INVALID_PARAMETER_VALUE), errmsg("invalid board state")));

    PG_FREE_IF_COPY(str, 0);
    PG_RETURN_BOARD_P(board);
}

PG_FUNCTION_INFO_V1(chess_game_in);
Datum chess_game_in(PG_FUNCTION_ARGS)
{
    char *str = PG_GETARG_CSTRING(0);

    SCL_Record *record = palloc(sizeof(SCL_Record));

    SCL_recordFromPGN(record, str);

    PG_FREE_IF_COPY(str, 0);
    PG_RETURN_GAME_P(record);
}

// Function to convert Chess Board to string
char *chess_board_to_str(SCL_Board board)
{
    char *str = palloc(sizeof(char) * 256);

    if (SCL_boardToFEN(board, str) != 0)
    {
        return str;
    }
}

PG_FUNCTION_INFO_V1(chess_board_out);
Datum chess_board_out(PG_FUNCTION_ARGS)
{
    SCL_Board *board = PG_GETARG_BOARD_P(0);

    char str[256];

    if (SCL_boardToFEN(board, str) == 0)
        ereport(ERROR, (errcode(ERRCODE_INVALID_PARAMETER_VALUE), errmsg("invalid board state")));

    PG_RETURN_CSTRING(str);
}

char str[4096];
void putCharStr(char c)
{

    char *s = str;

    while (*s != 0)
        s++;

    *s = c;
    *(s + 1) = 0;
}

// TODO: trim spaces from end of string?
char *chess_game_to_str(SCL_Record record)
{
    char *game = palloc(sizeof(char) * 4096);
    SCL_printPGN(record, putCharStr, 0);
    for (int i = 0; i < 4096; i++)
    {
        if (str[i] == '*')
            game[i] = '\0';
        else
            game[i] = str[i];
    }

    str[0] = '\0';
    // game = str[4096];
    return game;
}

PG_FUNCTION_INFO_V1(chess_game_out);
Datum chess_game_out(PG_FUNCTION_ARGS)
{
    char *game = palloc(sizeof(char) * 4096);

    SCL_Record *record = PG_GETARG_GAME_P(0);
    SCL_printPGN(record, putCharStr, 0);
    for (int i = 0; i < 4096; i++)
    {
        if (str[i] == '*')
            game[i] = '\0';
        else
            game[i] = str[i];
    }

    str[0] = '\0';
    // game = str[4096];
    PG_RETURN_CSTRING(game);
}

SCL_Board *get_starting_board()
{
    // TODO: should we use `palloc` for the `board`? since it's being freed by postgres
    SCL_Board *board = malloc(sizeof(SCL_Board));
    char *str = malloc(sizeof(char) * 256);

    strcpy(str, "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1");

    SCL_boardFromFEN(board, str);
    free(str);

    return board;
}

SCL_Board *get_board_internal(SCL_Record record, int half_moves)
{
    SCL_Board *board = get_starting_board();
    SCL_recordApply(record, board, half_moves);

    return board;
}

PG_FUNCTION_INFO_V1(getBoard);
Datum getBoard(PG_FUNCTION_ARGS)
{
    SCL_Record *record = PG_GETARG_GAME_P(0);
    int half_move = PG_GETARG_INT32(1);

    SCL_Board *board = get_board_internal(*record, half_move);

    PG_RETURN_BOARD_P(board);
}

void truncate_pgn_internal(char *chess_notation, int half_moves, char *result_board)
{
    int curr_str_idx = 0;
    int curr_half_move = 0;

    if (half_moves == 0)
    {
        result_board[0] = '\0';
        return;
    }

    while (1)
    {
        // copy the full move number and the space after it
        while (1)
        {
            result_board[curr_str_idx++] = chess_notation[curr_str_idx];
            if (result_board[curr_str_idx - 1] == ' ')
                break;
        }

        // copy the first move
        while (1)
        {
            result_board[curr_str_idx++] = chess_notation[curr_str_idx];
            if (result_board[curr_str_idx - 1] == ' ')
                break;
        }

        if (++curr_half_move == half_moves)
            break;

        // copy the second move
        while (1)
        {
            result_board[curr_str_idx++] = chess_notation[curr_str_idx];
            if (result_board[curr_str_idx - 1] == ' ' || result_board[curr_str_idx - 1] == '\0')
                break;
        }

        if (++curr_half_move == half_moves || result_board[curr_str_idx - 1] == '\0')
            break;
    }

    result_board[curr_str_idx] = '\0';
}

PG_FUNCTION_INFO_V1(getFirstMoves);
Datum getFirstMoves(PG_FUNCTION_ARGS)
{
    SCL_Record *record = PG_GETARG_GAME_P(0);
    int half_move = PG_GETARG_INT32(1);
    char *chess_game_str;
    char result_pgn[256];
    SCL_Record *output_record = palloc(sizeof(SCL_Record));

    chess_game_str = chess_game_to_str(record);
    truncate_pgn_internal(chess_game_str, half_move, result_pgn);
    SCL_recordFromPGN(output_record, result_pgn);
    PG_RETURN_GAME_P(output_record);
}

int compare_strings(char *str1, char *str2)
{
    // Check if str1 starts with str2 (ignoring the last character because it's an added *)
    // TODO: remove the -1 since we ignore the * now
    if (strncmp(str1, str2, strlen(str2) - 1) == 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

PG_FUNCTION_INFO_V1(hasOpening);
Datum hasOpening(PG_FUNCTION_ARGS)
{
    SCL_Record *record1 = PG_GETARG_GAME_P(0);
    SCL_Record *record2 = PG_GETARG_GAME_P(1);
    char *chess_game_str1;
    char *chess_game_str2;
    bool result;

    chess_game_str1 = chess_game_to_str(record1);
    chess_game_str2 = chess_game_to_str(record2);
    result = compare_strings(chess_game_str1, chess_game_str2);

    PG_RETURN_BOOL(result);
}

PG_FUNCTION_INFO_V1(hasBoard);
Datum hasBoard(PG_FUNCTION_ARGS)
{
    SCL_Record *record = PG_GETARG_GAME_P(0);
    SCL_Board *board = PG_GETARG_BOARD_P(1);
    int half_move = PG_GETARG_INT32(2);

    char *board_state1 = chess_board_to_str(board);
    int index1 = strcspn(board_state1, " ");

    for (int i = 0; i <= half_move; i++)
    {
        SCL_Board *result_board_state = get_board_internal(*record, i);

        char *board_state2 = chess_board_to_str(result_board_state);

        // TODO: SCL_boardsDiffer does not ignore the things after the board state
        // is there a function that does that? if not we can do our own?
        if (strncmp(board_state1, board_state2, index1) == 0)
        {
            PG_RETURN_BOOL(true);
        }
    }

    PG_RETURN_BOOL(false);
}

static int
compare_games(SCL_Record *c, SCL_Record *d)
{
    char *chess_game_str1;
    char *chess_game_str2;

    chess_game_str1 = chess_game_to_str(c);
    chess_game_str2 = chess_game_to_str(d);

    return strcmp(chess_game_str1, chess_game_str2);
}

PG_FUNCTION_INFO_V1(chess_game_lt);
Datum chess_game_lt(PG_FUNCTION_ARGS)
{
    SCL_Record *c = PG_GETARG_GAME_P(0);
    SCL_Record *d = PG_GETARG_GAME_P(1);

    bool result = compare_games(c, d) < 0;

    PG_FREE_IF_COPY(c, 0);
    PG_FREE_IF_COPY(d, 1);
    PG_RETURN_BOOL(result);
}

PG_FUNCTION_INFO_V1(chess_game_le);
Datum chess_game_le(PG_FUNCTION_ARGS)
{
    SCL_Record *c = PG_GETARG_GAME_P(0);
    SCL_Record *d = PG_GETARG_GAME_P(1);

    bool result = compare_games(c, d) <= 0;

    PG_FREE_IF_COPY(c, 0);
    PG_FREE_IF_COPY(d, 1);
    PG_RETURN_BOOL(result);
}

PG_FUNCTION_INFO_V1(chess_game_eq);
Datum chess_game_eq(PG_FUNCTION_ARGS)
{
    SCL_Record *c = PG_GETARG_GAME_P(0);
    SCL_Record *d = PG_GETARG_GAME_P(1);

    bool result = compare_games(c, d) == 0;

    PG_FREE_IF_COPY(c, 0);
    PG_FREE_IF_COPY(d, 1);
    PG_RETURN_BOOL(result);
}

PG_FUNCTION_INFO_V1(chess_game_gt);
Datum chess_game_gt(PG_FUNCTION_ARGS)
{
    SCL_Record *c = PG_GETARG_GAME_P(0);
    SCL_Record *d = PG_GETARG_GAME_P(1);

    bool result = compare_games(c, d) > 0;

    PG_FREE_IF_COPY(c, 0);
    PG_FREE_IF_COPY(d, 1);
    PG_RETURN_BOOL(result);
}

PG_FUNCTION_INFO_V1(chess_game_ge);
Datum chess_game_ge(PG_FUNCTION_ARGS)
{
    SCL_Record *c = PG_GETARG_GAME_P(0);
    SCL_Record *d = PG_GETARG_GAME_P(1);

    bool result = compare_games(c, d) >= 0;

    PG_FREE_IF_COPY(c, 0);
    PG_FREE_IF_COPY(d, 1);
    PG_RETURN_BOOL(result);
}

PG_FUNCTION_INFO_V1(chess_game_cmp);
Datum chess_game_cmp(PG_FUNCTION_ARGS)
{
    SCL_Record *c = PG_GETARG_GAME_P(0);
    SCL_Record *d = PG_GETARG_GAME_P(1);

    int diff = compare_games(c, d);

    int result = 0;
    if (diff < 0)
        result = -1;
    else if (diff > 0)
        result = 1;

    PG_FREE_IF_COPY(c, 0);
    PG_FREE_IF_COPY(d, 1);
    PG_RETURN_INT32(result);
}