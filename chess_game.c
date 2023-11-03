#include <postgres.h>

#include "utils/builtins.h"
#include "libpq/pqformat.h"

#include "smallchesslib.h"

PG_MODULE_MAGIC;

#define DatumGetBoardP(X) ((SCL_Board *)DatumGetPointer(X))
#define BoardPGetDatum(X) PointerGetDatum(X)
#define PG_GETARG_BOARD_P(n) DatumGetBoardP(PG_GETARG_DATUM(n))
#define PG_RETURN_BOARD_P(x) return BoardPGetDatum(x)

PG_FUNCTION_INFO_V1(chess_board_in);
Datum chess_board_in(PG_FUNCTION_ARGS)
{
	char *str = PG_GETARG_CSTRING(0);

	elog(INFO, "chess_board_in: %s", str);

	SCL_Board board = SCL_BOARD_START_STATE;
	if (SCL_boardFromFEN(board, "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1") == 0)
		ereport(ERROR, (errcode(ERRCODE_INVALID_PARAMETER_VALUE), errmsg("invalid board state")));

	PG_FREE_IF_COPY(str, 0);
	PG_RETURN_BOARD_P(board);
}

PG_FUNCTION_INFO_V1(chess_board_out);
Datum chess_board_out(PG_FUNCTION_ARGS)
{
	SCL_Board *board = PG_GETARG_BOARD_P(0);
	char *str = palloc(SCL_FEN_MAX_LENGTH);

	if (SCL_boardToFEN(&board, str) == 0)
		ereport(ERROR, (errcode(ERRCODE_INVALID_PARAMETER_VALUE), errmsg("invalid board state")));

	elog(INFO, "chess_board_out: %s", str);

	PG_RETURN_CSTRING(str);
}