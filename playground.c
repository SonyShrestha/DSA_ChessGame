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

void truncate_pgn(char *chess_notation, int half_moves, char *result_board)
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

int main()
{
    char pgn[] = "1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3 b5";

    for (int i = 0; i < 12; i++)
    {
        char *pgn_result = malloc(sizeof(char) * 256);
        truncate_pgn(pgn, i, pgn_result);
        printf("%2d -> %s\n", i, pgn_result);
        free(pgn_result);
    }

    return 0;
}