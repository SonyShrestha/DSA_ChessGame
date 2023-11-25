------------------------------------ Validate getBoard(chessgame, integer) functionality ---------------------------------
/*
Return the board state at a given half-move
*/

SELECT getBoard('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',0);
/*
Output
                         getboard
----------------------------------------------------------
 rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1
(1 row)
*/


SELECT getBoard('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',1);
/*
Output
                          getboard
-------------------------------------------------------------
 rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1
(1 row)
*/


SELECT getBoard('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',2);
/*
Output
                           getboard
---------------------------------------------------------------
 rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2
*/



-------------------- Return boardstate of all games present in table chessgame after 4 half moves ----------------------
SELECT getBoard(pgn,4) FROM chessgame limit 10;
/*
Output
                             getboard
-------------------------------------------------------------------
 rnbqkbnr/p1ppppp1/1p5p/8/P6P/8/1PPPPPP1/RNBQKBNR w KQkq - 0 3
 rnbqkb1r/1ppppppp/p6n/8/6P1/2P5/PP1PPP1P/RNBQKBNR w KQkq - 1 3
 rnbqkbnr/pppppppp/8/8/6P1/8/PPPPPP1P/RNBQKBNR w KQkq - 1 3
 rnbqkbnr/1pppp1pp/p4p2/8/P7/2N5/1PPPPPPP/R1BQKBNR w KQkq - 0 3
 rnbqkbnr/1ppppp1p/p5p1/8/3P4/7N/PPP1PPPP/RNBQKB1R w KQkq - 0 3
 rnb1kbnr/ppppqppp/4p3/8/8/N5P1/PPPPPP1P/R1BQKBNR w KQkq - 1 3
 rnbqkbnr/p1ppppp1/7p/1p6/6P1/5P2/PPPPP2P/RNBQKBNR w KQkq - 0 3
 rnbqkbnr/1ppppp1p/p7/6p1/P7/5P2/1PPPP1PP/RNBQKBNR w KQkq - 0 3
 rnbq1bnr/pppppkpp/5p2/8/6P1/P7/1PPPPP1P/RNBQKBNR w KQ - 1 3
 rnbqkbnr/pp1ppp1p/8/2p3p1/5P2/3P4/PPP1P1PP/RNBQKBNR w KQkq g6 0 3
(10 rows)
*/