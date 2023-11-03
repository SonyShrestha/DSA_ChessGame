#include <stdio.h>
#include <stdlib.h>
#include "string.h"
#include "smallchesslib.h"

void putCharacter(char c)
{
    putchar(c);
}

SCL_Board *get_starting_board()
{
    SCL_Board *board = malloc(sizeof(SCL_Board));
    char *str = malloc(sizeof(char) * 256);

    strcpy(str, "1nbqkb1r/pp5p/2p3pn/1r3p2/N2PPQ2/1Q5N/PP2BPPP/R1B2RK1 b k - 0 1");

    SCL_boardFromFEN(board, str);
    free(str);

    return board;
}

int main()
{
    char *board = get_starting_board();

    SCL_SquareSet emptySquareSet = SCL_SQUARE_SET_EMPTY;

    SCL_printBoard(
        board,
        putCharacter,
        emptySquareSet,
        255,
        SCL_PRINT_FORMAT_UTF8,
        4,
        1,
        0);

    char str[256];
    SCL_boardToFEN(board, str);

    printf("%s\n", str);
    free(board);

    return 0;
}