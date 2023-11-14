#include <stdio.h>
#include <stdlib.h>
#include "string.h"
#include <stddef.h>
#include <math.h>

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

void truncate_pgn(char *chess_notation, int n, char *result_board)
{
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
                int move_number = 0;
                int digit_idx = idx - 1;

                int prev_space_idx = -1;

                while (digit_idx >= 0)
                {
                    char c = chess_notation[digit_idx];
                    if (c == ' ')
                    {
                        prev_space_idx = digit_idx;
                        break;
                    }

                    int digit = c - '0';

                    move_number += (digit * pow(10, idx - 1 - digit_idx));

                    digit_idx--;
                }

                if (move_number > n)
                {
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
    char pgn[] = "1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3";
    SCL_Record *record = malloc(sizeof(SCL_Record));
    SCL_recordFromPGN(record, pgn);

    SCL_Board board;
    SCL_recordApply(record, board, 2);

    SCL_SquareSet emptySquareSet = SCL_SQUARE_SET_EMPTY;
    SCL_printBoard(board, putCharacter, emptySquareSet, 255, SCL_PRINT_FORMAT_UTF8, 4, 1, 0);

    char fen[256];
    SCL_boardToFEN(&board, fen);
    printf("%s\n", fen);

    free(record);

    return 0;
}