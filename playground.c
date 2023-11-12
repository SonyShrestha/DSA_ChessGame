#include <stdio.h>
#include <stdlib.h>
#include "string.h"
#include <stddef.h>

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

// make a function get_firt_n_moves(str, n) that returns the board after n moves
// for instance if input was 1. h4 g5 2. hxg5 Nf6 3. Nf3 Bg7 4. e3 O-O 5. Nc3 c5 6. d3 c4 7. b4 cxb3 8. Ba3 Qc7 9. Qd2 Nc6 10. O-O-O Nd5 11. cxb3 Ncb4 12. g6 Qxc3+ 13. Qc2 d6 14. gxh7+ Kh8 15. Qxc3 Bxc3 16. Bxb4 Kg7 17. h8=R Nxb4 18. Be2 Kf6 19. Rhf1 Kg7 20. Rfh1 Na6 21. R1h4* and n = 5
// then the output would be `1. h4 g5 2. hxg5 Nf6 3. Nf3 Bg7 4. e3 O-O 5. Nc3 c5`

void get_first_n_moves(char *chess_notation, int n, char *result_board)
{
    // keep looping over characters and appending to the result_board string
    // util you find `x.` where x is bigger than n

    int idx = 0;

    while (1)
    {
        char c = chess_notation[idx];
        if (c == '\0')
        {
            break;
        }

        if (c == '.')
        {
            char next_char = chess_notation[idx + 1];
            if (next_char == ' ')
            {
                // get the previous number (which is the move number), it might be more than one digit
                int move_number = 0;
                int i = idx - 1;

                int prev_space_idx = -1;

                while (1)
                {
                    char c = chess_notation[i];
                    if (c == ' ')
                    {
                        prev_space_idx = i;
                        break;
                    }

                    int digit = c - '0';
                    move_number += digit;
                    move_number *= 10;
                    i--;
                }

                move_number /= 10;

                if (move_number > n)
                {
                    // remove the previous number and the space
                    result_board[prev_space_idx] = '\0';
                    break;
                }
            }
        }

        result_board[idx] = c;
        idx++;
    }

    result_board[idx] = '\0';
}

int main()
{
    char *initial_pgn = "1. h4 g5 2. hxg5 Nf6 3. Nf3 Bg7 4. e3 O-O 5. Nc3 c5 6. d3 c4 7. b4 cxb3 8. Ba3 Qc7 9. Qd2 Nc6 10. O-O-O Nd5 11. cxb3 Ncb4 12. g6 Qxc3+ 13. Qc2 d6 14. gxh7+ Kh8 15. Qxc3 Bxc3 16. Bxb4 Kg7 17. h8=R Nxb4 18. Be2 Kf6 19. Rhf1 Kg7 20. Rfh1 Na6 21. R1h4*";

    char result_pgn[256];
    get_first_n_moves(initial_pgn, 9, result_pgn);
    printf("%s\n", result_pgn);

    return 0;
}
