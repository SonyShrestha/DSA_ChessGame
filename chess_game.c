#include <postgres.h>

#include "utils/builtins.h"
#include "libpq/pqformat.h"
#include <stdint.h>
#include "smallchesslib.h"
#include "access/gin.h"
#include "access/stratnum.h"
#include "utils/array.h"
#include "utils/builtins.h"
#include "utils/lsyscache.h"

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
    SCL_Board *board = palloc(sizeof(SCL_Board));
    char *str = palloc(sizeof(char) * 256);

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

// TODO: update this operation to append `~~` at the end of the second string
//  so it can be used efficiently in a B-tree index.
//  see: https://www.richard-towers.com/2023/01/29/finding-the-longest-matching-prefix-in-sql.html
PG_FUNCTION_INFO_V1(chess_game_lt);
Datum chess_game_lt(PG_FUNCTION_ARGS)
{
    SCL_Record *c = PG_GETARG_GAME_P(0);
    SCL_Record *d = PG_GETARG_GAME_P(1);

    char *chess_game_str1 = chess_game_to_str(c);

    char *chess_game_str2 = chess_game_to_str(d);
    strcat(chess_game_str2, "~~");

    bool result = strcmp(chess_game_str1, chess_game_str2) < 0;

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

// ------------------------------------------------------------------------------------------- //
// checks if the first chessgame contains all moves from the second chessgame

PG_FUNCTION_INFO_V1(chess_contains_func);

Datum chess_contains_func(PG_FUNCTION_ARGS)
{
    SCL_Record *game = PG_GETARG_GAME_P(0);
    SCL_Record *subgame = PG_GETARG_GAME_P(1);

    // Convert to C strings
    char *game_str = chess_game_to_str(game);
    char *subgame_str = chess_game_to_str(subgame);

    // Check if subgame_str is contained in game_str
    bool contains = strstr(game_str, subgame_str) != NULL;

    PG_FREE_IF_COPY(game, 0);
    PG_FREE_IF_COPY(subgame, 1);
    PG_RETURN_BOOL(contains);
}

PG_FUNCTION_INFO_V1(chess_equals_func);

Datum chess_equals_func(PG_FUNCTION_ARGS)
{
    SCL_Record *c = PG_GETARG_GAME_P(0);
    SCL_Record *d = PG_GETARG_GAME_P(1);

    // Assuming compare_games function returns 0 if games are equal, and non-zero otherwise
    int diff = compare_games(c, d);

    // Check if the games are equal
    bool result = (diff == 0);

    PG_FREE_IF_COPY(c, 0);
    PG_FREE_IF_COPY(d, 1);

    PG_RETURN_BOOL(result);
}

PG_FUNCTION_INFO_V1(chess_move_compare);

Datum chess_move_compare(PG_FUNCTION_ARGS)
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

PG_FUNCTION_INFO_V1(chess_board_compare);

Datum chess_board_compare(PG_FUNCTION_ARGS)
{
    SCL_Board *c = PG_GETARG_BOARD_P(0);
    SCL_Board *d = PG_GETARG_BOARD_P(1);

    char *board1 = chess_board_to_str(c);
    char *board2 = chess_board_to_str(d);

    int diff = compare_strings(board1, board2);

    int result = 0;
    if (diff < 0)
        result = -1;
    else if (diff > 0)
        result = 1;

    PG_FREE_IF_COPY(c, 0);
    PG_FREE_IF_COPY(d, 1);
    PG_RETURN_INT32(result);
}

int countCommas(char *str)
{
    int count = 0;
    while (*str)
    {
        if (*str == ',')
        {
            count++;
        }
        str++;
    }
    return count;
}

//
// parses a string of chess game notation, extracts individual moves (ignoring the move numbers),
// and stores them in an array. This array, along with the count of moves, is then returned.
// This function is particularly tailored for use in a GIN index, where it would be used to extract
// indexable elements (the moves) from the stored data (the game notation

PG_FUNCTION_INFO_V1(chess_game_extractQuery);

Datum chess_game_extractQuery(PG_FUNCTION_ARGS)
{
    SCL_Board *board = PG_GETARG_BOARD_P(0);
    int32_t *nkeys = (int32_t *)PG_GETARG_POINTER(1);

    StrategyNumber strategy = PG_GETARG_UINT16(2);

    bool **pmatch = (bool **)PG_GETARG_POINTER(3);
    Pointer *extra_data = (Pointer *)PG_GETARG_POINTER(4);
    bool **nullFlags = (bool **)PG_GETARG_POINTER(5);
    int32 *searchMode = (int32 *)PG_GETARG_POINTER(6);

    *searchMode = GIN_SEARCH_MODE_DEFAULT;

    // Make a copy of the input string because strtok modifies the string
    // char *inputCopy = strdup(query_str);

    // int total_boards = countCommas(query_str)+1;

    // char *keys = (char **) malloc(total_boards * sizeof(char));
    // int counter = 0;

    // // Tokenize the string
    // const char delim[2] = ",";
    // char *token = strtok(inputCopy, delim);

    // while (token != NULL) {
    //     if ((keys[counter] = (char *)malloc(strlen(token) + 1)) != NULL) {
    //         strcpy(keys[counter], token);
    //     }
    //     counter+=1;
    //     token = strtok(NULL, delim);
    // }

    *nkeys = 1;
    // PG_FREE_IF_COPY(query_text, 0);
    PG_RETURN_BOARD_P(board);
}

int count_half_moves(SCL_Record record)
{
    char *chess_game_str = chess_game_to_str(record);

    // Initialize the counter for half-moves
    int total_half_moves = 0;

    // Tokenize the string considering both space and period as delimiters
    char *token, *saveptr;
    const char delim[3] = " .";
    token = strtok_r(chess_game_str, delim, &saveptr);

    while (token != NULL)
    {
        // Skip move numbers and count only the moves
        if (!isdigit(token[0]))
        {
            total_half_moves++;
        }

        // Get the next token
        token = strtok_r(NULL, delim, &saveptr);
    }

    // Return the total number of half-moves
    return total_half_moves;
}

PG_FUNCTION_INFO_V1(chess_game_extractValue);

Datum chess_game_extractValue(PG_FUNCTION_ARGS)
{
    SCL_Record *record = PG_GETARG_GAME_P(0);
    int32_t *nkeys = (int32_t *)PG_GETARG_POINTER(1);
    bool **nullFlags = (bool **)PG_GETARG_POINTER(2);

    char *chess_game_str = chess_game_to_str(record);
    int total_half_moves = count_half_moves(record);
    char *keys = (char **)palloc(total_half_moves * sizeof(char));
    bool *nulls;

    for (int half_move = 0; half_move < total_half_moves; ++half_move)
    {
        SCL_Board *board = get_board_internal(record, half_move);
        char *board_state_str = chess_board_to_str(board);

        if ((keys[half_move] = (char *)palloc(strlen(board_state_str) + 1)) != NULL)
        {
            strcpy(keys[half_move], board_state_str);
        }
    }
    *nkeys = total_half_moves;
    *nullFlags = nulls;
    PG_FREE_IF_COPY(record, 0);
    PG_RETURN_POINTER(keys);
}

PG_FUNCTION_INFO_V1(chess_game_consistent);

Datum chess_game_consistent(PG_FUNCTION_ARGS)
{
    // Retrieve the array indicating which query keys are present in the indexed value
    bool *check = (bool *)PG_GETARG_POINTER(0);
    // Retrieve the strategy number
    uint16 strategy = PG_GETARG_UINT16(1);
    // Query information is not used in this example but can be used for more complex strategies
    Datum query = PG_GETARG_DATUM(2);
    // Number of keys in the query
    int32 nkeys = PG_GETARG_INT32(3);
    // Extra data passed from the extractQuery function, not used in this example
    Pointer *extra_data = (Pointer *)PG_GETARG_POINTER(4);
    // Pointer to flag indicating whether a recheck is required
    bool *recheck = (bool *)PG_GETARG_POINTER(5);

    strategy = 1;

    // Example: Simple exact matching strategy
    if (strategy == 1)
    {
        // Iterate over each key
        for (int i = 0; i < nkeys; i++)
        {
            // If any of the keys are present, the indexed value is consistent with the query
            if (check[i])
            {
                *recheck = false; // No need to recheck as the index test is deemed exact
                PG_RETURN_BOOL(true);
            }
        }
    }

    // No keys matched, or for other unhandled strategies, return false
    *recheck = false;
    // PG_FREE_IF_COPY(check, 0);
    // PG_FREE_IF_COPY(strategy, 1);
    // PG_FREE_IF_COPY(query, 2);
    // PG_FREE_IF_COPY(extra_data,4);
    // PG_FREE_IF_COPY(recheck,5);
    PG_RETURN_BOOL(false);
}
