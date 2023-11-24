-------------------------------------------------------- Implementation of Chess Game Data Type --------------------------------------------------------
-- Validate creating table with chess_board data type followed by insert and select statement 
CREATE TABLE chessboard(fen chess_board);

INSERT INTO chessboard 
VALUES
('r2q1rk1/1b1pbppp/p4n2/1pp3B1/3pP3/PB1P4/1PP1NPPP/R2Q1RK1 b - - 1 12');

SELECT * FROM chessgame;
/*
Output
                                  fen
------------------------------------------------------------------------
 r2q1rk1/1b1pbppp/p4n2/1pp3B1/3pP3/PB1P4/1PP1NPPP/R2Q1RK1 b KQkq - 1 12
(1 row)
*/




-- Validate type cast operation from string to chess_board data type
SELECT 'r2q1rk1/1b1pbppp/p4n2/1pp3B1/3pP3/PB1P4/1PP1NPPP/R2Q1RK1 b - - 1 12'::chess_board;
/* 
Output
                              chess_board
------------------------------------------------------------------------
 r2q1rk1/1b1pbppp/p4n2/1pp3B1/3pP3/PB1P4/1PP1NPPP/R2Q1RK1 b KQkq - 1 12
(1 row)
*/