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

    strcpy(str, "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1");

    SCL_boardFromFEN(board, str);
    free(str);

    return board;
}

SCL_Board *getBoard(SCL_Record record, int half_moves)
{
    SCL_Board *board = get_starting_board();
    SCL_recordApply(record, board, half_moves);

    return board;
}

void print_board(SCL_Board *board)
{
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
    char str_board[256];
    SCL_boardToFEN(board, str_board);

    printf("%s\n", str_board);
}

int main()
{
    char *str = "1. h4 g5 2. hxg5 Nf6 3. Nf3 Bg7 4. e3 O-O 5. Nc3 c5 6. d3 c4 7. b4 cxb3 8. Ba3 Qc7 9. Qd2 Nc6 10. O-O-O Nd5 11. cxb3 Ncb4 12. g6 Qxc3+ 13. Qc2 d6 14. gxh7+ Kh8 15. Qxc3 Bxc3 16. Bxb4 Kg7 17. h8=R Nxb4 18. Be2 Kf6 19. Rhf1 Kg7 20. Rfh1 Na6 21. R1h4*";
    SCL_Record *record = malloc(sizeof(SCL_Record));
    SCL_recordFromPGN(record, str);

    SCL_Board *board = getBoard(*record, 1);
    print_board(board);
    free(board);

    SCL_Board *board_2 = getBoard(*record, 2);
    print_board(board_2);
    free(board_2);

    return 0;
}
