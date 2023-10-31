#include "postgres.h"
#include "fmgr.h"
#include "smallchesslib.h"
PG_MODULE_MAGIC;


PG_FUNCTION_INFO_V1(chess_board_in);
Datum
chess_board_in(PG_FUNCTION_ARGS)
{
	char* str = PG_GETARG_CSTRING(0);
	uint8_t i;
	SCL_Board board = SCL_BOARD_START_STATE;
	

	i=SCL_boardFromFEN(board,&str);

	PG_FREE_IF_COPY(str, 0);
	PG_RETURN_INT64(i);
}




PG_FUNCTION_INFO_V1(chess_board_out);
Datum
chess_board_out(PG_FUNCTION_ARGS)
{
}