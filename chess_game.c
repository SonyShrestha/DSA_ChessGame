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

PG_FUNCTION_INFO_V1(chess_game_out);
Datum chess_game_out(PG_FUNCTION_ARGS)
{
    char *game = palloc(sizeof(char) * 4096);

    SCL_Record *record = PG_GETARG_GAME_P(0);
    SCL_printPGN(record, putCharStr, 0);
    for (int i = 0; i < 4096; i++)
    {
        game[i] = str[i];
    }

    str[0] = '\0';
    // game = str[4096];
    PG_RETURN_CSTRING(game);
}

// TODO: probably there's something simpler to get the initial board from smallchesslib
SCL_Board *get_starting_board()
{
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