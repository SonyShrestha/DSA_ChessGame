-- Drop extension if exists
DROP EXTENSION IF EXISTS chess_game cascade;
/*
DROP EXTENSION
*/

-- Create Extension 
CREATE EXTENSION chess_game;
/*
CREATE EXTENSION
*/

-- Drop Table if exists
DROP TABLE IF EXISTS chessgame;
/*
NOTICE:  table "chessgame" does not exist, skipping
DROP TABLE
*/

-- Create Table chessgame with a column containing chess_game
CREATE TABLE chessgame(pgn chess_game);
/*
CREATE TABLE
*/

-- Load data into chessgame table 
-- sample_pgn10000.csv was generated using python code inside generateSamplePGN.py file
COPY chessgame(pgn)
FROM '/mnt/c/ULB/Database Systems Architecture/Project/git/DSA_ChessGame/sample_pgn10000.csv'
DELIMITER ','
CSV HEADER;
/*
COPY 10000
*/




-- Drop Table chessboard if exists
DROP TABLE IF EXISTS chessboard;
/*
NOTICE:  table "chessboard" does not exist, skipping
DROP TABLE
*/

-- Create Table chessboard
CREATE TABLE chessboard(fen chess_board);
/*
CREATE TABLE
*/

-- Insert one row into chessboard table
INSERT INTO chessboard 
VALUES
('r2q1rk1/1b1pbppp/p4n2/1pp3B1/3pP3/PB1P4/1PP1NPPP/R2Q1RK1 b - - 1 12');
/*
INSERT 0 1
*/

-- Read from chessboard table
SELECT * FROM chessboard;
/*
                                  fen
------------------------------------------------------------------------
 r2q1rk1/1b1pbppp/p4n2/1pp3B1/3pP3/PB1P4/1PP1NPPP/R2Q1RK1 b KQkq - 1 12
(1 row)
*/

-- Validate type cast operation from string to chess_board data type
SELECT 'r2q1rk1/1b1pbppp/p4n2/1pp3B1/3pP3/PB1P4/1PP1NPPP/R2Q1RK1 b - - 1 12'::chess_board;
/*
                              chess_board
------------------------------------------------------------------------
 r2q1rk1/1b1pbppp/p4n2/1pp3B1/3pP3/PB1P4/1PP1NPPP/R2Q1RK1 b KQkq - 1 12
(1 row)
*/



-- Validate creating table with chess_game data type followed by insert and select statement 
-- Drop Table if exixts
DROP TABLE IF EXISTS chessgame1;
/*
DROP TABLE
*/

-- Create table chessgame1
CREATE TABLE chessgame1(pgn chess_game);
/*
CREATE TABLE
*/

-- Insert into chessgame1
INSERT INTO chessgame1
VALUES('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4
11. Ne2 c5 12. Bg5 d5 13. Bxf6 Bxf6 14. Bxd5 Bxd5 15. exd5 Qxd5 16. Ng3 c4 17. Re1 Rae8 18. a4 Rxe1+ 19. Qxe1 cxd3 20. cxd3 bxa4
21. Qd1 Qb5 22. Ne4 Be7 23. Qc2 Rb8 24. Rxa4 Qxb2 25. Qxb2 Rxb2 26. g4 Rb6 27. Rxd4 Kf8 28. Rd7 Rg6 29. Kf1 Rxg4
30. Ra7 f5 31. Ng3 g6 32. Rxa6 Rh4 33. Kg2 Rd4 34. Ne2 Rxd3 35. Ng1 Rd7 36. Nf3 Kg7 37. h3 Bf6 38. Kg3 Rb7 39. Kg2 Re7
40. Ra5 Rc7 41. Rd5 Ra7 42. Rb5 Be7 43. Nd4 Rd7 44. Nf3 Rd6 45. Rb7 Kf6 46. Ra7 h6 47. Nh4 Bd8 48. Rh7 Rd2 49. Rxh6 Kg7
50. Rxg6+ Kh7 51. Nf3 Rxf2+ 52. Kxf2 Kxg6 53. Kg2 Kh5 54. Nd4 f4 55. Ne6 Bg5 56. Nxg5 Kxg5 57. Kf3 Kh4 58. Kxf4 Kxh3 1/2-1/2');
/*
INSERT 0 1
*/

-- Read data from chessgame1
SELECT * FROM chessgame1;
/*                                                                                                               pgn      
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4 11. Ne2 c5 12. Bg5 d5 13. Bxf6 Bxf6 14. Bxd5 Bxd5 15. exd5 Qxd5 16. Ng3 c4 17. Re1 Rae8 18. a4 Rxe1+ 19. Qxe1 cxd3 20. cxd3 bxa4 21. Qd1 Qb5 22. Ne4 Be7 23. Qc2 Rb8 24. Rxa4 Qxb2 25. Qxb2 Rxb2 26. g4 Rb6 27. Rxd4 Kf8 28. Rd7 Rg6 29. Kf1 Rxg4 30. Ra7 f5 31. Ng3 g6 32. Rxa6 Rh4 33. Kg2 Rd4 34. Ne2 Rxd3 35. Ng1 Rd7 36. Nf3 Kg7 37. h3 Bf6 38. Kg3 Rb7 39. Kg2 Re7 40. Ra5 Rc7 41. Rd5 Ra7 42. Rb5 Be7 43. Nd4 Rd7 44. Nf3 Rd6 45. Rb7 Kf6 46. Ra7 h6 47. Nh4 Bd8 48. Rh7 Rd2 49. Rxh6 Kg7 50. Rxg6+ Kh7 51. Nf3 Rxf2+ 52. Kxf2 Kxg6 53. Kg2 Kh5 54. Nd4 f4 55. Ne6 Bg5 56. Nxg5 Kxg5 57. Kf3 Kh4 58. Kxf4 Kxh3
(1 row)
*/

-- Validate type cast operation from string to chess_game data type
SELECT 
'1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4 
11. Ne2 c5 12. Bg5 d5 13. Bxf6 Bxf6 14. Bxd5 Bxd5 15. exd5 Qxd5 16. Ng3 c4 17. Re1 Rae8 18. a4 Rxe1+ 19. Qxe1 cxd3 20. cxd3 bxa4 
21. Qd1 Qb5 22. Ne4 Be7 23. Qc2 Rb8 24. Rxa4 Qxb2 25. Qxb2 Rxb2 26. g4 Rb6 27. Rxd4 Kf8 28. Rd7 Rg6 29. Kf1 Rxg4 
30. Ra7 f5 31. Ng3 g6 32. Rxa6 Rh4 33. Kg2 Rd4 34. Ne2 Rxd3 35. Ng1 Rd7 36. Nf3 Kg7 37. h3 Bf6 38. Kg3 Rb7 39. Kg2 Re7 
40. Ra5 Rc7 41. Rd5 Ra7 42. Rb5 Be7 43. Nd4 Rd7 44. Nf3 Rd6 45. Rb7 Kf6 46. Ra7 h6 47. Nh4 Bd8 48. Rh7 Rd2 49. Rxh6 Kg7 
50. Rxg6+ Kh7 51. Nf3 Rxf2+ 52. Kxf2 Kxg6 53. Kg2 Kh5 54. Nd4 f4 55. Ne6 Bg5 56. Nxg5 Kxg5 57. Kf3 Kh4 58. Kxf4 Kxh3 1/2-1/2'::chess_game as pgn_notaion;
/*
pgn_notaion  

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4 11. Ne2 c5 12. Bg5 d5 13. Bxf6 Bxf6 14. Bxd5 Bxd5 15. exd5 Qxd5 16. Ng3 c4 17. Re1 Rae8 18. a4 Rxe1+ 19. Qxe1 cxd3 20. cxd3 bxa4 21. Qd1 Qb5 22. Ne4 Be7 23. Qc2 Rb8 24. Rxa4 Qxb2 25. Qxb2 Rxb2 26. g4 Rb6 27. Rxd4 Kf8 28. Rd7 Rg6 29. Kf1 Rxg4 30. Ra7 f5 31. Ng3 g6 32. Rxa6 Rh4 33. Kg2 Rd4 34. Ne2 Rxd3 35. Ng1 Rd7 36. Nf3 Kg7 37. h3 Bf6 38. Kg3 Rb7 39. Kg2 Re7 40. Ra5 Rc7 41. Rd5 Ra7 42. Rb5 Be7 43. Nd4 Rd7 44. Nf3 Rd6 45. Rb7 Kf6 46. Ra7 h6 47. Nh4 Bd8 48. Rh7 Rd2 49. Rxh6 Kg7 50. Rxg6+ Kh7 51. Nf3 Rxf2+ 52. Kxf2 Kxg6 53. Kg2 Kh5 54. Nd4 f4 55. Ne6 Bg5 56. Nxg5 Kxg5 57. Kf3 Kh4 58. Kxf4 Kxh3
(1 row)
*/



-- Return the board state at a given half-move
SELECT getBoard('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',0);
/*
                         getboard
----------------------------------------------------------
 rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1
(1 row)
*/

SELECT getBoard('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',1);
/*
                          getboard
-------------------------------------------------------------
 rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1
(1 row)
*/

SELECT getBoard('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',2);
/*
                           getboard
---------------------------------------------------------------
 rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2
(1 row)
*/

-- Return boardstate of all games present in table chessgame after 4 half moves
SELECT getBoard(pgn,4) FROM chessgame limit 10;
/*
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




-- Validation of getFirstMoves function
SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', 0);
/*
 getfirstmoves
---------------

(1 row)
*/

SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', 1);
/*
 getfirstmoves
---------------
 1. e4
(1 row)
*/

SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',2);
/*
 getfirstmoves
---------------
 1. e4 e5
(1 row)
*/

SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',3);
/*
  getfirstmoves
-----------------
 1. e4 e5 2. Nf3
(1 row)
*/

SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',4);
/*
    getfirstmoves
---------------------
 1. e4 e5 2. Nf3 Nc6
(1 row)
*/

-- Return first 3 half moves of all games present in table chessgame
SELECT getFirstMoves(pgn,3),pgn FROM chessgame limit 10;
/*
pgn
-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1. a4 h6 2. h4  | 1. a4 h6 2. h4 b6 3. Nf3 Rh7 4. b3 Nf6 5. Nc3 Bb7 6. d4 d5 7. a5 Nc6 8. Bg5 Qd6 9. Rh2 Rh8 10. e3 Nh5 11. Ra2 f5 12. a6 Nf4 13. Bc4 O-O-O 14. Bxh6 Ba8 15. Ra3 Na5 16. Bd3 Nxb3 17. Na2 Nxd4 18. Nc3 e5 19. Qb1 Nfe2 20. Qd1 Nb3 21. Bf4 Nbc1 22. Bc4 Qc5 23. Ba2 Qa5 24. g4 Nb3 25. Rxa5 Nc5 26. Ne4 exf4 27. Kf1 fxe3 28. Ned2 Rd6 29. Ra3 Kb8 30. Bc4 Be7 31. Qb1 Rh7 32. h5 g5 33. Qb2 Rd8 34. Ne1 Nd7 35. f3 Nf4 36. Qb1 b5 37. Rh4 exd2 38. Be2 d1=R 39. Ra4 Rf7 40. Rxf4 Bc5 41. Qc1 Rf6 42. Rh2 Be3 43. Qa1 Rc8 44. Qa3 Bc5 45. Qc1 Be7 46. Re4 Rc6 47. Qb1 d4 48. Qa1 Bf8 49. Re7 Nf6 50. Qc3 f4 51. Re6 Be7 52. Rg2 Rf8 53. Qa3 Rb6 54. Qb4 Rd2 55. Rf2 Rg8 56. Rxf6 Rxa6 57. Qa4 Rg7 58. Bxb5 Ba3 59. Bd3 Rxc2 60. Rf5 Rf6 61. Qa5 Rfc6 62. Qd2 R2c5 63. Bc2 Ra5 64. Qc3 Rf7 65. Qa1 Kc8 66. Be4 R6c5 67. Rf6 Rxf6 68. Bc6 Rf7 69. Bb7+ Kd8 70. Bc6 Bb4 71. Ke2 Re5+ 72. Kd1 Re2 73. Bd7 Kxd7 74. Qa3 Bd5 75. Qa2 Ba8 76. h6 Rb2 77. Qb1 Ke6 78. Qc1 Kf6 79. Rxb2 Bf8 80. Qe3 Kg6 81. Rd2 Bxh6 82. Rd3 c6 83. Qe5 Rf5 84. Qb5 Kf7 85. Rd2 Kg6 86. Qa4 Bb7 87. Qa1 Ra4 88. Rc2 Rb4 89. Ke2 a6 90. Rb2 Ba8 91. Ra2 Rb6 92. Ra3 d3+ 93. Rxd3 Rc5 94. Qd1 Bb7 95. Qa4 Kf7 96. Qxa6 Rc4 97. Rd8 R6b4 98. Kd2 Kg7 99. Ke2 Rc1 100. Qb5 Rb2+ 101. Nc2 R2b1 102. Qd3 Rb3 103. Rd5 Kf7 104. Qh7+ Kf8 105. Ne3 Rbc3 106. Rc5 Rd3 107. Nf5 Rc4 108. Qe7+ Kg8 109. Rxc6 Rd7 110. Ng3 R7d4 111. Qf8+ Kh7 112. Rc8 Be4 113. Nh1 Rc6 114. Qb4 Rcd6 115. Ke1 Bc6 116. Rg8 R6d5 117. Qc4 Rd3 118. Rd8 Rb3 119. Qxc6 Rb6 120. Ke2 R6b5 121. Rxd5 Rb1 122. Qc7+ Kg8 123. Rc5 Kh8 124. Rb5 Kg8 125. Qc3 Rb4 126. Qc6 Rd4 127. Qe8+ Kg7 128. Qc8 Rd3
1. g4 a6 2. c3  | 1. g4 a6 2. c3 Nh6 3. h4 e5 4. Nf3 a5 5. b4 Nc6 6. g5 Ne7 7. bxa5 Rg8 8. g6 b5 9. Ba3 Ba6 10. Bd6 Qb8 11. Nd4 Ra7 12. Bb4 hxg6 13. Qc1 Nef5 14. Qa3 d5 15. e4 Nxd4 16. Bc5 Bb7 17. Be7 Ra8 18. d3 g5 19. Qc1 g4 20. Na3 g5 21. Rb1 Qd8 22. Nxb5 Rb8 23. Na7 Bxe7 24. Kd2 Ba3 25. Rg1 c6 26. Rxg4 Bd6 27. Bg2 Bc7 28. Rb2 Qf6 29. Rg3 Qe7 30. Rb4 Ndf5 31. Rb3 Rd8 32. Qd1 Bc8 33. a6 Bb7 34. Rxg5 Qa3 35. Qa1 Qc5 36. Rxg8+ Kd7 37. Qg1 Qc4 38. Ra3 Ke7 39. Ra5 f6 40. Rb5 Ne3 41. Bh3 dxe4 42. Kc1 Qxc3+ 43. Kb1 Neg4 44. Bf1 Nf7 45. Re8+ Kd6 46. dxe4 Ra8 47. axb7 f5 48. Rg8 c5 49. b8=R Qg3 50. Rge8 Qxf2 51. a4 Qf3 52. R8b7 Rxa7 53. R5b6+ Bxb6 54. Qxg4 Rxa4 55. Qxf3 Nh8 56. Ba6 Ra3 57. Qg2 Rc3 58. Bd3 Kc6 59. h5 f4 60. Ka2 Bc7 61. Rb2 f3 62. Qd2 Rc4 63. Rb1 Ng6 64. Rf1 Ra4+ 65. Kb1 Bb8 66. Rxb8 Ra6 67. Kc2 Ne7 68. Ra1 Kd6 69. Qc1 c4 70. Rc8 Ng6 71. Qe1 Ra8 72. Qc1 Ra4 73. Kd1 Nf4 74. Kd2 Ng6 75. Rd8+ Kc6 76. Qf1 Nh4 77. Rxa4 c3+ 78. Ke1 Kb6 79. Ra2 c2 80. Ra4 c1=Q+ 81. Kf2 Qxf1+ 82. Ke3 Qb1 83. Ra1 Qh1 84. Bc2 Qg1+ 85. Kd2 Qc5 86. Ra4 Qe3+ 87. Kd1 Kb5 88. Rda8 Qd4+ 89. Ke1 Ng6 90. Bb3 Qxe4+ 91. Kd2 Qb7 92. Kd3 Qd5+ 93. Ke3 Qd3+ 94. Kf2 Qe2+ 95. Kg1 Qe4 96. Rb8+ Kc5 97. Ra6 Qe3+ 98. Kf1 Qc3 99. Bf7 f2 100. Re8 Nh4 101. Rb6 Qa5 102. Bd5 Kxb6 103. Rf8 e4 104. Bc6 Qd5 105. Re8 Qg8 106. Rxg8 Kc5 107. Rb8 Kd6 108. Rf8 Kc7 109. Be8 Nf3 110. Rf7+ Kb8 111. Rf8 Ka8 112. Kg2 Ka7 113. Bb5 Ng5 114. Bf1 Nh3 115. Rf5 Ng1 116. Rf4 Nh3 117. Rf5 Ng5 118. Rxf2 Nf7 119. Kh2 Ng5 120. Rd2 Nf7 121. Rd3 Nh8 122. Rd5 Nf7 123. Kh3 Ka8 124. Ba6 Ne5 125. Rd2 Ka7 126. Kh2 Nd3 127. Bc8 Ka8 128. Bh3 Nc1
1. g3 Nf6 2. g4 | 1. g3 Nf6 2. g4 Ng8 3. d3 b6 4. Nc3 d6 5. Nb1 Na6 6. d4 c6 7. Bg2 Be6 8. Na3 b5 9. Nf3 Qa5+ 10. b4 f5 11. d5 Nf6 12. Bf4 Qb6 13. Bf1 Qb8 14. Rc1 g6 15. e4 Qc8 16. Rg1 Kd7 17. Rg2 Nc5 18. Bxd6 Qd8 19. Qe2 Ng8 20. dxc6+ Kxd6 21. bxc5+ Kxc6 22. h4 Bb3 23. Rh2 Bc4 24. Bh3 Qd4 25. Nd2 Qd5 26. e5 Qd4 27. Nab1 Kd5 28. Na3 Rc8 29. Rh1 Nh6 30. Ndxc4 e6 31. Qd2 Nxg4 32. Qa5 Bg7 33. Nxb5 Nh2 34. Rf1 Qe3+ 35. Nxe3+ Ke4 36. Qa6 Bf8 37. Qxe6 Rb8 38. Rg1 Rb6 39. Rf1 Rb8 40. Ke2 Rc8 41. Qe8 Rc6 42. h5 Kf4 43. f3 Be7 44. Bxf5 Rb6 45. Bg4 Bd6 46. Rb1 gxh5 47. cxd6 Rg8 48. d7 Rh6 49. Ng2+ Kg5 50. Na3 Rf8 51. c3 Rhf6 52. Kd1 Rf5 53. Qa8 R5f6 54. d8=Q hxg4 55. Qd6 Rg6 56. Qd2+ Kh5 57. Qad5 Rh8 58. Qd6 Re6 59. Qe2 Rh6 60. Qd7 a6 61. Qxh7 Rd8+ 62. Qd2 Rd5 63. Kc2 Rxh7 64. Rb7 Re7 65. R7b1 Re8 66. Rb8 R5d8 67. Qe3 Rd5 68. Qa7 Rf8 69. R8b1 Kg6 70. Kc1 Rfd8 71. Rf2 g3 72. Nb5 Rd1+ 73. Kb2 R8d7 74. Qa8 R1d6 75. Ka3 Kf7 76. Qb8 axb5 77. Rb3 Rg6 78. Ne1 Ra6+ 79. Kb2 Ra8 80. Qxa8 Ng4 81. Rc2 Rd1 82. Rb4 Rd6 83. Qa4 Rd8 84. f4 Rb8 85. Rb3 Nh6 86. Qa5 Ng4 87. Ka3 Nxe5 88. Rf2 Nd3 89. Qa7+ Kf6 90. Qa4 b4+ 91. Qxb4 Re8 92. Rd2 Nc5 93. Qb5 Rh8 94. Qb4 Re8 95. Qe4 Nxb3 96. Qh1 Re6 97. Rf2 Ke7 98. Rc2 Na5 99. Qg2 Nb7 100. Qh3 Kd8 101. Rd2+ Ke7 102. Qf5 Rxe1 103. Rd5 Re6 104. Qf6+ Rxf6 105. Kb4 Re6 106. Rc5 Rg6 107. Rc7+ Kf6 108. Rf7+ Kxf7 109. a4 Kf6 110. c4 Rg7 111. f5 Rf7 112. Ka3 Na5 113. Kb2 g2 114. Kc2 Rf8 115. Kd2 Ke7 116. Ke2 Rh8 117. Kd1 Rg8 118. Ke1 Rg3 119. Kd2 Kf6 120. c5 Kxf5 121. Ke1 g1=B 122. Kd1 Rf3 123. Kd2 Nc4+ 124. Kc2 Ne3+ 125. Kd2 Ke6 126. Ke2 Rg3 127. Kd3 Nf5+ 128. Kc2 Ke7
1. Nc3 f6 2. a4 | 1. Nc3 f6 2. a4 a6 3. Nb5 d5 4. d3 b6 5. Nd4 Qd6 6. c3 Bf5 7. Bd2 h5 8. c4 Qb4 9. Ra3 Bxd3 10. e3 Nd7 11. Rb3 Nb8 12. Qf3 Bh7 13. Qh3 Qxd2+ 14. Kxd2 Be4 15. Qe6 g5 16. Qxd5 Bb1 17. h4 e5 18. f4 Ba3 19. Be2 gxf4 20. bxa3 Ra7 21. Rb4 Bg6 22. Ngf3 Bd3 23. Rh2 Nc6 24. Rh1 exd4 25. Qd8+ Nxd8 26. Bf1 Kd7 27. Rh2 Ke6 28. e4 Kf7 29. Rb5 Bc2 30. Ke1 Bxa4 31. c5 Bb3 32. cxb6 Kg6 33. Ne5+ Kg7 34. Nc4 Bd1 35. a4 Rb7 36. Nd6 d3 37. Rh3 Bxa4 38. Ra5 Ne6 39. Rf5 Kg6 40. Rc5 Bc6 41. Bxd3 Ba4 42. g4 Nf8 43. Nf5 hxg4 44. Kd2 Bb5 45. Ne7+ Kf7 46. Kd1 Rh7 47. Nc6 g3 48. Rxg3 Ba4+ 49. Ke2 Rh8 50. Rb5 Nh6 51. Rf5 Ng4 52. Rxf6+ Kxf6 53. Bb1 f3+ 54. Rxf3+ Ke6 55. Rf5 Rh7 56. h5 Nd7 57. Kf1 Ndf6 58. Bd3 Bd1 59. Kg2 Kf7 60. Kh3 Rh6 61. Rf4 Ba4 62. Kg3 Rb8 63. Ne5+ Kg8 64. Bc4+ Kf8 65. Kh4 Rg6 66. Bd3 Nh6 67. Nd7+ Kg7 68. Rf2 Bd1 69. Bc2 Kh8 70. Re2 R6g8 71. Bd3 Nf7 72. Rf2 c6 73. Ra2 Nd6 74. Rd2 Nfxe4 75. Nf8 Be2 76. Rxe2 Rg6 77. Ne6 Nc8 78. Nd8 Rh6 79. Rd2 Rg6 80. Ne6 Rxb6 81. Bb1 Rg1 82. Kh3 Nf2+ 83. Kh4 Rc1 84. Bd3 Na7 85. Bc2 R6b1 86. Bxb1 Re1 87. Rb2 Ng4 88. Ra2 Re2 89. Nd4 Rxa2 90. Be4 Nb5 91. Bd5 Rb2 92. Bf7 Rd2 93. Bg6 Nd6 94. Kg5 Rxd4 95. Be4 Rb4 96. Bh7 Rb3 97. Bd3 Ne4+ 98. Kh4 Ng3 99. Bf5 Rd3 100. h6 Rd5 101. Bxg4 Nf1 102. Bc8 c5 103. Bxa6 Rd1 104. Bb5 Rd5 105. Be8 Rd7 106. Kg5 Rb7 107. Kh5 Rf7 108. Bxf7 Nd2 109. Kg4 Kh7 110. Bb3 Ne4 111. Kh5 Nc3 112. Kg5 Na2 113. Kf4 Nc3 114. Kf5 Na4 115. Bg8+ Kh8 116. h7 Kg7 117. Bf7 Nb2 118. Kg4 Kxf7 119. h8=N+ Ke8 120. Nf7 Kf8 121. Kh4 Nc4 122. Nd8 Nd2 123. Kh3 Nf1 124. Nf7 Nh2 125. Kg2 Nf3 126. Ng5 Nh4+ 127. Kh3 Nf3 128. Nf7 Ng1+
1. d4 g6 2. Nh3 | 1. d4 g6 2. Nh3 a6 3. g3 c6 4. f3 e5 5. Na3 Qg5 6. Rb1 Bb4+ 7. Kf2 Bc3 8. Bd2 Ba5 9. c3 Qd8 10. Bg2 Nf6 11. Bg5 h5 12. Bc1 Qe7 13. b4 Qxb4 14. Qc2 Rf8 15. Nb5 Nh7 16. Ba3 Qxb1 17. Qe4 Qxa2 18. dxe5 Qd5 19. Ng5 Qe6 20. Nxe6 Ra7 21. Qa4 g5 22. Nf4 Rg8 23. Bd6 h4 24. Qc2 Rf8 25. c4 g4 26. c5 Rg8 27. Qc1 f5 28. Bc7 Rf8 29. Qd1 Ke7 30. Qa4 cxb5 31. Qb3 Bb4 32. e6 Ke8 33. c6 Nxc6 34. Nh3 Rf7 35. Qd3 Ba3 36. Rc1 Re7 37. Ng1 Bb4 38. Rc5 Kf8 39. Ba5 Nd8 40. f4 Bc3 41. Bh3 b4 42. Nf3 Re8 43. e4 gxh3 44. Qe2 b3 45. Rc7 Ra8 46. gxh4 Ba1 47. Qf1 Nf7 48. Qd3 fxe4 49. Qd1 e3+ 50. Kg1 Bc3 51. Qc2 dxe6 52. Qb1 Kg8 53. Qa1 Kg7 54. Qd1 Rh8 55. Rc5 Bb4 56. Qd4+ Kg6 57. Rc7 b5 58. Nd2 Re8 59. Qd5 exd5 60. Rc4 Re7 61. h5+ Kh6 62. Bc7 a5 63. Nf3 Ne5 64. Nh4 a4 65. Bd6 R8a7 66. Rxc8 Nc6 67. Kh1 Ng5 68. Nf3 Reb7 69. Rb8 Kxh5 70. Re8 Re7 71. Rc8 Nxf3 72. Be5 Nd8 73. Rc5 Rac7 74. f5 Ne6 75. Rc1 Rc8 76. Rg1 Nc5 77. Bf6 Be1 78. Bh8 Nd3 79. Bb2 Rd7 80. Bc3 Rxc3 81. Rg4 Rb7 82. Rg1 Nb4 83. Rg5+ Kxg5 84. f6 Rc2 85. f7 Rb2 86. f8=Q Nc2 87. Qc5 b4 88. Qxb4 Ng1 89. Qb5 Kh6 90. Qa6+ Rb6 91. Kxg1 e2 92. Qd3 Kg7 93. Qf3 Rh6 94. Qh1 Rd6 95. Qxd5 Kh8 96. Qe5+ Kh7 97. Qg3 Ra2 98. Qg5 Rb6 99. Kh1 Bc3 100. Qg1 Bd2 101. Qg2 Bc1 102. Qg1 Be3 103. Qf1 e1=R 104. Qg1 Rb5 105. Qf1 Rxf1#
1. Na3 e6 2. g3 | 1. Na3 e6 2. g3 Qe7 3. d4 Nh6 4. e4 d5 5. Bg5 Qd7 6. Qb1 Qa4 7. Bxh6 Qa5+ 8. c3 Be7 9. Bg2 gxh6 10. Nf3 f5 11. Bf1 c6 12. h4 Qc7 13. Qd3 Qb6 14. Nd2 Qb4 15. f3 a6 16. e5 Qb6 17. Bg2 f4 18. Rd1 c5 19. c4 fxg3 20. Ndb1 Bf6 21. Rg1 O-O 22. Nc3 Kh8 23. Bf1 Qb4 24. Ra1 Rf7 25. Qe4 Nd7 26. Be2 a5 27. Bf1 cxd4 28. Qe2 dxc3 29. Nb1 Qe7 30. Qd1 Qb4 31. Be2 Ra7 32. Qd2 Nxe5 33. f4 b6 34. Kf1 d4 35. Rh1 Rfb7 36. Kg2 Bg5 37. Qc2 Bd8 38. Bg4 Be7 39. Nxc3 Qxc4 40. Rab1 Bg5 41. Rhd1 Be7 42. Rxd4 Ba3 43. Rd8+ Bf8 44. Rd7 Qxa2 45. fxe5 Rb8 46. Qe2 b5 47. Qc4 bxc4 48. Rxh7+ Kxh7 49. h5 R8b7 50. Rg1 Qa3 51. Kh1 Ra8 52. b4 Qb3 53. Na4 g2+ 54. Rxg2 Rb5 55. Rf2 Qxa4 56. Rf1 Qd1 57. bxa5 c3 58. Kg1 Rab8 59. Kh2 Qxf1 60. Be2 R5b6 61. Bd3+ Qf5 62. axb6 Rxb6 63. Kg2 Rb8 64. Bf1 Kg7 65. Kh1 Kh7 66. Bg2 Qd3 67. Kg1 c2 68. Bb7 Qe4 69. Kf2 Bb4 70. Kg1 Kh8 71. Kf1 Qe3 72. Bc6 c1=B 73. Bb7 Bd6 74. Bc6 Qg3 75. Bb5 Qe1+ 76. Kg2 Be7 77. Bf1 Kg7 78. Ba6 Qf1+ 79. Kxf1 Bea3 80. Bd3 Rb3 81. Ke1 Rb5 82. Bh7 Rb8 83. Be4 Bb4+ 84. Ke2 Ba6+ 85. Kf2 Rd8 86. Bc6 Kg8 87. Bh1 Bb7 88. Bg2 Ba6 89. Ba8 Be7 90. Kf3 Beg5 91. Kf2 Rd4 92. Be4 Rd5 93. Bg2 Bd8 94. Bxd5 Bd2 95. Bb3 Bf4 96. Ke1 Bfg5 97. Ba2 Bc1 98. Bc4 Bf4 99. Bxe6+ Kh7 100. Bd5 Be2 101. Ba8 Bg3+ 102. Kxe2 Bxe5 103. Ke3 Bg3 104. Ke4 Bb8 105. Kd3 Ba5 106. Bh1 Bd6 107. Bf3 Ba3 108. Ke2 Bc7 109. Kd1 Bg3 110. Be2 Bc1 111. Bf3 Bcf4 112. Ke2 Bb8 113. Bg4 Bh4 114. Bf5+ Kg8 115. Bg6 Bh2 116. Be4 Bhg3 117. Bf3 Bc7 118. Kd2 Bb8 119. Bg2 Be7 120. Ke2 Bc7 121. Kd2 Bb4+ 122. Kc1 Bf4+ 123. Kb1 Be5 124. Bf1 Bd2 125. Kc2 Kf7 126. Kb1 Bg5 127. Bh3 Ba1 128. Be6+ Ke8
1. f3 b5 2. g4  | 1. f3 b5 2. g4 h6 3. g5 a5 4. c3 g6 5. e3 Bg7 6. Nh3 Nc6 7. d3 Ne5 8. b4 Nxd3+ 9. Qxd3 e6 10. Rg1 Rb8 11. Rg4 Rh7 12. Be2 c6 13. Rg3 Nf6 14. Kd1 Bf8 15. Kd2 Ng4 16. Qf5 Bg7 17. Qxf7+ Kxf7 18. Kc2 a4 19. Bf1 Qe8 20. Bc4 Bf8 21. Kb2 Kg8 22. Ng1 Kh8 23. gxh6 Nxh6 24. Rg4 Bg7 25. Na3 d5 26. Re4 Qg8 27. Nc2 Be5 28. Rf4 Qf7 29. Re4 g5 30. Bxd5 Bc7 31. Bd2 Bb6 32. Bb3 Ng4 33. Bxe6 Bd4 34. Kb1 c5 35. Bxc8 Rh5 36. c4 Qb7 37. Bxg4 Qh7 38. a3 Qf7 39. Nxd4 Kh7 40. Be1 Rf8 41. Nxb5 Kh8 42. Bd2 Qf4 43. Nh3 Qc7 44. Re5 Qb6 45. Bd7 Rh7 46. Nf4 Rc8 47. Re6 Rd8 48. Ka2 Rh4 49. Be1 Rh6 50. Ng6+ Kg7 51. Bf2 Qb7 52. Rc6 Qb8 53. Rc7 Qb6 54. Rg1 Qb8 55. Rxc5 Qa8 56. Nd6 Rh4 57. Nc8 Rh7 58. Nce7 Kf7 59. Bf5 Rd7 60. Bc2 Qf8 61. f4 Qb8 62. h3 Rh4 63. Rcxg5 Rxh3 64. Bh4 Qb6 65. Nf8 Qd6 66. R5g3 Rb7 67. Bf6 Qxf6 68. Bg6+ Kxf8 69. f5 Ra7 70. R3g2 Rg3 71. Kb1 Qd6 72. Rh1 Qf6 73. R1h2 Rg4 74. Nc8 Qxf5+ 75. Bxf5 Ra8 76. Rg3 Ra5 77. Re2 Rd5 78. Kc1 Rh4 79. Rg5 Re4 80. Kc2 Rd8 81. Kc3 Rd5 82. R5g2 Re7 83. b5 Rxf5 84. Nd6 Rh7 85. Rh2 Ra7 86. Rh7 Ra8 87. Rg7 Kxg7 88. Rh2 Kg8 89. Kb2 Kg7 90. c5 Rxc5 91. Rh8 Rd8 92. Nf7 Kg6 93. Rh3 Rc3 94. Ka2 Rg8 95. Rh7 Rc5 96. Ng5 Rd8 97. e4 Rd2+ 98. Ka1 Rdc2 99. Rf7 Rc6 100. b6 R2c4 101. b7 Rf6 102. e5 Rc2 103. Ne4 Rf1+ 104. Rxf1 Re2 105. Rh1 Rg2 106. Re1 Kh5 107. Rd1 Rg6 108. Rd8 Rg7 109. b8=R Rf7 110. Nd2 Kh4 111. Ne4 Kg4 112. Nf2+ Kf5 113. Kb1 Rd7 114. Nd1 Rg7 115. Ka2 Rc7 116. Rf8+ Ke6 117. Rh8 Kf7 118. Kb2 Rc4 119. Rh5 Rc1 120. Rh2 Rc6 121. Ka1 Ke7 122. Ra8 Rc1+ 123. Kb2 Rb1+ 124. Kc2 Ra1 125. Rd2 Rb1 126. Rb8 Rxd1 127. Kxd1 Ke6 128. R2d8 Kf5
1. f3 g5 2. a4  | 1. f3 g5 2. a4 a6 3. g3 c6 4. Nc3 Nh6 5. h3 Ng8 6. Nd5 Qb6 7. Ra3 h6 8. b3 Qxb3 9. d3 g4 10. Bb2 b6 11. a5 f5 12. Ba1 Qxd3 13. Rc3 e6 14. e4 Kd8 15. cxd3 Ra7 16. exf5 Bb4 17. Qb3 Bxa5 18. Ne2 e5 19. Qb4 e4 20. Nxb6 Rb7 21. Rc1 gxh3 22. f6 Rc7 23. Nxc8 exd3 24. Nd4 Nxf6 25. Nf5 Ne8 26. Bb2 Nd6 27. Nfxd6 d2+ 28. Kxd2 Rh7 29. Nb7+ Kxc8 30. Bb5 Rf7 31. Rhg1 h2 32. Ke1 Bb6 33. g4 a5 34. Ba4 Be3 35. Qxa5 Rf4 36. Bc2 Rf8 37. Qe5 Bb6 38. Bb3 Rd8 39. Qg7 Rf8 40. Rf1 Rg8 41. Qe7 Rg6 42. Bh8 c5 43. Kd2 Rg7 44. Rf2 h1=N 45. f4 Nxf2 46. Ba2 c4 47. Rg1 Ba5+ 48. Kc1 h5 49. Qe4 Bc3 50. f5 Nc6 51. Rh1 Rg6 52. gxh5 Ng4 53. Qe8+ Kxb7 54. Rh3 Nb8 55. Qe3 Rg5 56. Qxc3 Nh6 57. Qf3+ Nc6 58. Kd2 Ka7 59. Rh1 Rg8 60. Rf1 c3+ 61. Qxc3 Kb6 62. Bb1 Rg1 63. Qd4+ Kb5 64. Kc1 Rb7 65. Qd3+ Kc5 66. Qc4+ Kd6 67. Qc3 Rg5 68. Kd2 Nb8 69. Bd3 Rxh5 70. Qf6+ Kd5 71. Qf8 Rb2+ 72. Ke1 Rb4 73. Qe7 Rbh4 74. Qa3 Rc4 75. Bb2 Rc5 76. Qb3+ Rc4 77. Rf2 Kd6 78. Bb1 Rb4 79. Qa4 Rb7 80. Bh8 Nxf5 81. Bxf5 Kc5 82. Be6 Rxh8 83. Bh3 Kd6 84. Qxd7+ Rxd7 85. Ra2 Rb7 86. Bf1 Rf8 87. Ra6+ Kd7 88. Ra5 Rf2 89. Rg5 Rb3 90. Bc4 Kc6 91. Bxb3 Nd7 92. Be6 Rf1+ 93. Ke2 Nb6 94. Rd5 Re1+ 95. Kd2 Kc7 96. Ra5 Kc6 97. Ra7 Nd7 98. Bg8 Nf6 99. Bc4 Rf1 100. Be6 Rc1 101. Bd5+ Kb6 102. Rc7 Nxd5 103. Rc3 Nc7 104. Kxc1 Ka7 105. Rg3 Ne6 106. Kd1 Ka8 107. Rg2 Kb7 108. Re2 Nd8 109. Kc2 Nf7 110. Kc3 Nh6 111. Kd2 Ka8 112. Ke3 Nf7 113. Kf3 Kb7 114. Re8 Ka7 115. Kg3 Nh6 116. Rb8 Kxb8
1. a3 f6 2. g4  | 1. a3 f6 2. g4 Kf7 3. Ra2 a6 4. Ra1 Ke6 5. Nc3 Kf7 6. Nd5 b6 7. Bg2 Ra7 8. c4 b5 9. Nxf6 Qe8 10. d3 h5 11. Kd2 exf6 12. b3 Qe6 13. b4 Kg6 14. g5 Qb6 15. h3 Qd4 16. Rb1 a5 17. Kc2 Nc6 18. Rh2 Nd8 19. Bf1 Ra6 20. Rb2 Bb7 21. Kb3 Qxd3+ 22. Qxd3+ Be4 23. Qd1 Bxb4 24. Bd2 Bb1 25. Bc3 Nh6 26. e4 Ba2+ 27. Rxa2 Bf8 28. Qd2 c6 29. Qd6 a4+ 30. Kc2 Nb7 31. Kd3 Nc5+ 32. Ke3 Rh7 33. Qxd7 Nd3 34. Rb2 Nxf2 35. Qe8+ Nf7 36. e5 c5 37. Kd2 fxe5 38. h4 Re6 39. Bg2 Nd1 40. Rb4 Nxc3 41. Qd7 Nd1 42. Rh3 cxb4 43. Qd8 Rb6 44. Rd3 Kf5 45. Bh1 Nxd8 46. g6 Rh6 47. Nf3 Kxg6 48. Ng5 Kf6 49. Bf3 Bc5 50. Bxh5 Rc6 51. Nh3 Rc8 52. Bf3 bxa3 53. Rd4 Nf7 54. Bd5 Rf8 55. Re4 Bb4+ 56. Kxd1 R6h8 57. Rg4 Rb8 58. Rg2 e4 59. h5 Rbd8 60. Rd2 Rb8 61. Bc6 Rb7 62. Bd7 Rh6 63. cxb5 Bxd2 64. Ke2 Rg6 65. h6 Nxh6 66. Kd1 Bc3 67. Be6 Ba5 68. Bf7 Kxf7 69. Kc1 Ke8 70. Kd1 Be1 71. Kxe1 R7b6 72. Kf1 Rbc6 73. Kf2 Rc2+ 74. Ke3 Rh2 75. Nf4 Rb2 76. Nh5 Nf5+ 77. Kf4 Kd7 78. b6 Rd2 79. Ke5 e3 80. Nf6+ gxf6+ 81. Kxf5 Rg8 82. Kf4 Rg7 83. b7 Rg5 84. b8=B a2 85. Be5 Kd8 86. Bc7+ Ke7 87. Bb8 a1=R 88. Bc7 Rd8 89. Be5 Rc8 90. Bxf6+ Kxf6 91. Kf3 Rgc5 92. Kg4 R5c1 93. Kh5 Ra3 94. Kh6 e2 95. Kh5 Rf8 96. Kh6 Rh3#
1. f4 c5 2. d3  | 1. f4 c5 2. d3 g5 3. b3 f5 4. Qd2 g4 5. Qb4 Qc7 6. h3 cxb4 7. Nf3 b5 8. a3 Kf7 9. h4 Bh6 10. Nc3 gxf3 11. Bd2 Qa5 12. Nd5 fxe2 13. g3 bxa3 14. Rh3 Qc7 15. Rh1 exf1=B 16. Rb1 b4 17. Bxb4 Qe5+ 18. Kd1 Kg6 19. Nc3 Ba6 20. Ra1 Qd5 21. Rb1 Bb5 22. Ba5 Be2+ 23. Kc1 Kh5 24. Bd8 Bd1 25. b4 e6 26. Rb3 Kg6 27. Rb1 Qb7 28. Na4 Qf3 29. Ba5 Qxg3 30. Nb6 Qxf4+ 31. Kxd1 Qc1+ 32. Ke2 Qb2 33. Rbe1 Bc1 34. Nc8 Kh5 35. Rxc1 Qb3 36. Kf1 a6 37. Na7 Qxd3+ 38. Kg2 Ne7 39. Kh2 f4 40. Rhe1 Qxc2+ 41. Kh3 Re8 42. Re2 Qb3+ 43. Kg2 Qd3 44. Nc6 Kh6 45. Kf1 d6 46. Nxe7 Bd7 47. Ng8+ Kh5 48. Rd1 Rxg8 49. Ke1 Qf5 50. Ra2 Rg4 51. Rad2 e5 52. Rxd6 f3 53. Rh6+ Kxh6 54. h5 a2 55. Kf1 Nc6 56. Kf2 e4 57. Rd5 a1=Q 58. Rd2 Ra7 59. Ke3 Qc5+ 60. bxc5 Qb1 61. Bc3 Bc8 62. Bg7+ Kg5 63. Rh2 Qb5 64. Bf8 Rf7 65. Bg7 Ne5 66. Bh8 Rf8 67. c6 Qb3+ 68. Kf2 Qb8 69. Bxe5 Qb1 70. h6 Qf1+ 71. Kxf1 Rh4 72. Rd2 Kh5 73. Rd7 Rg4 74. Bh2 Kxh6 75. Bb8 Rg7 76. Rd2 Re7 77. Rb2 f2 78. Re2 Kh5 79. Be5 Bd7 80. Bd4 e3 81. Ra2 Re4 82. Ba7 a5 83. Bb8 Bg4 84. Bg3 Bd1 85. Rxa5+ Rf5 86. Bh4 Rc5 87. Kg2 Rc4 88. Kh1 Bb3 89. Bf6 Rxa5 90. c7 Rf5 91. c8=Q Rcf4 92. Bb2 Rb5 93. Qa6 Ba4 94. Bd4 f1=R+ 95. Kh2 Rc5 96. Qd6 Rxd4 97. Qd7 R4d1 98. Kg2 Rg1+ 99. Kh3 Rg2 100. Qd6 Ra1 101. Qxc5+ Kh6 102. Qf5 Bd1 103. Qf2 e2 104. Qf1 Ra7 105. Qxd1 Kh5 106. Qd3 Rb7 107. Qg3 Re7 108. Qb3 Kh6 109. Qa2 Kg5 110. Qa1 Re6 111. Qh1 Rg4 112. Qd5+ Kf4 113. Qd3 Re7 114. Qxe2 Rg3+ 115. Kh2 Rg4 116. Qe1 Re4 117. Qe2 Re5 118. Qd1 Rd5 119. Qf1+ Ke4 120. Qd3+ Rxd3 121. Kh1 Kd5 122. Kh2 Rh4+ 123. Kg2 Rhd4 124. Kf2 h5 125. Ke1 Kd6 126. Kf1 Rd1+ 127. Kf2 Ra4 128. Ke3 Rg4
(10 rows)
*/



-- Validation of hasOpening function
SELECT hasOpening('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', '1. e4 e5 2. Nf3 Nc6');
/*
 hasopening
------------
 t
(1 row)
*/

SELECT hasOpening('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', '1. Nf3 c6 2. a3 d6');
/*
 hasopening
------------
 f
(1 row)
*/

-- Return all games from the table chessgame which opened with moves given by 1. e4 d6 
SELECT * FROM chessgame WHERE hasOpening(pgn,'1. e4 d6') LIMIT 2;
/*
Output
 1. e4 d6 2. g4 Nc6 3. Ke2 g6 4. Ke3 Bd7 5. a4 Bc8 6. Kf4 e6 7. Be2 Bh6+ 8. g5 Na5 9. Nf3 Kf8 10. Ne1 Bd7 11. gxh6 Bc6 12. Nc3 e5+ 13. Kg4 Nf6+ 14. Kg3 Ke7 15. Bd3 d5 16. b3 Ne8 17. Bc4 dxe4 18. Nf3 Rc8 19. Nb5 f5 20. c3 Qd6 21. Qe2 Qe6 22. Rf1 Bd7 23. Re1 c5 24. Ra3 f4+ 25. Kh4 Kf8 26. Nbd4 Qc6 27. Ra2 Nc7 28. Bf7 Ke7 29. Qc4 Bh3 30. Nxe5 Qe8 31. Rxe4 Qg8 32. Be6 b6 33. Qb5 Na8 34. Nf7 Bf5 35. Bxf5+ Kf8 36. Qxc5+ Rxc5 37. Re2 gxf5 38. Re3 Re5 39. Ng5 Re6 40. Bb2 Ke7 41. Ne2 Kf8 42. Re5 Rc6 43. d3 b5 44. d4 Qg6 45. Nxf4 Nb7 46. b4 Qg8 47. Bc1 Nc7 48. Ng2 a5 49. Rxf5+ Rf6 50. f3 Qc4 51. Kh5 Ke8 52. Re2+ Kd7 53. Nf4 axb4 54. axb5 Na6 55. Rc2 Qe6 56. d5 bxc3 57. Re2 Qe7 58. d6 Ke8 59. Rb2 Qe5 60. Rb1 Nb8 61. Nd3 Rxd6 62. Nxh7 Qd4 63. h3 c2 64. Rg5 Rg6 65. Nb4 Qg1 66. Rd5 Rf6 67. Na2 Qh1 68. Rd3 Nc5 69. Nb4 Kf7 70. Ng5+ Ke7 71. Ra1 Rh7 72. Ra2 Qxc1 73. Rd2 Na4 74. Nd3 Ke8 75. Nf4 Rd7 76. Ra3 Rc6 77. Ra2 Nb2 78. bxc6 Na6 79. Nge6 Qb1 80. Rxb2 Qa2 81. Rbxc2 Rxd2 82. c7 Rd1 83. Rb2 Rd4 84. Kh4 Ra4 85. c8=N Nc5 86. Rxa2 Nd3 87. Ra3 Rd4 88. Kg4 Re4 89. Rb3 Rb4 90. Kh4 Rb6 91. h7 Rb7 92. Rxb7 Ne5 93. h8=Q#
 1. e4 d6 2. c3 g5 3. Qa4+ b5 4. Qa5 g4 5. Qxa7 c6 6. d4 Be6 7. h4 h6 8. f3 Qc7 9. g3 Qd8 10. Kd2 Nd7 11. Rh3 Rh7 12. Bd3 gxh3 13. Kc2 Rb8 14. Kd1 b4 15. Qxb8 Nc5 16. a4 Rg7 17. Be2 Bd7 18. Bd2 Rxg3 19. Bd3 Qxb8 20. c4 Rg6 21. d5 Ne6 22. Ke2 Nc5 23. Na3 Qb7 24. Bf4 Rf6 25. Ra2 Na6 26. e5 c5 27. Bg3 e6 28. Ra1 bxa3 29. Bf4 Qxb2+ 30. Bc2 Nb4 31. Ke1 Bb5 32. Be4 Ne7 33. Rxa3 Rxf4 34. Bh7 Qc3+ 35. Kf2 f6 36. a5 Qxf3+ 37. Ke1 Qe4+ 38. Kd2 Qg2+ 39. Ke3 Ng6 40. Nf3 Na6 41. Nh2 Qc2 42. Rd3 Qxd3+ 43. Kxd3 Be7 44. exd6 h5 45. Kd2 Nb4 46. Ke2 Kf8 47. dxe7+ Kxe7 48. Ke1 Kd6 49. Bg8 Na2 50. Ng4 Bc6 51. Ne3 Rxc4 52. Ke2 Ne7 53. Ke1 Rc3 54. Nf5+ Ke5 55. Nxe7 Be8 56. Ke2 Bc6 57. Bf7 Rc2+ 58. Kd1 Bd7 59. Bg8 Ke4 60. Nc8 Bxc8 61. Bxe6 f5 62. Bd7 Kd3 63. Ba4 f4 64. Bd7 h2 65. Be6 Rf2 66. Bf5+ Kc4 67. Bh7 Rd2+ 68. Kxd2 Kb5 69. Bb1 Bb7 70. a6 Kc4 71. Bd3+ Kd4 72. Bf5 Bc8 73. a7 Kxd5 74. Be6+ Kd4 75. Bxa2 Bb7 76. a8=N Bh1 77. Nb6 c4 78. Bb1 Bb7 79. Nd5 h1=R 80. Be4 Kxe4 81. Nc3+ Kd4 82. Ne2+ Kd5 83. Kc2 c3 84. Nc1 Ba6 85. Nb3 Bd3+ 86. Kxd3 Ke5 87. Kxc3 Ra1 88. Nc5 Kd5 89. Nb3 Kc6 90. Nxa1 Kc5 91. Nb3+ Kb6 92. Kc2 Kc6 93. Nc1 Kd7 94. Kd2 f3 95. Ke3 Ke8 96. Kd4 Kf8 97. Kc4 Kg8 98. Nb3 Kg7 99. Nd2 f2 100. Kb3 f1=R 101. Nxf1 Kf7 102. Ka2 Kg7 103. Ne3 Kh6 104. Kb1 Kh7 105. Kb2 Kg8 106. Ka2 Kf7 107. Nc4 Kg7 108. Ne3 Kf7 109. Nf1 Ke6 110. Ne3 Kf6 111. Ng2 Ke7 112. Nf4 Kd6 113. Ka3 Ke5 114. Ng2 Ke6 115. Ka2 Ke7 116. Ne1 Kd7 117. Kb3 Ke7 118. Nf3 Kd8 119. Ne5 Kc7 120. Nc6 Kd6 121. Kb4 Kc7 122. Ne5 Kd8 123. Ng6 Kc8 124. Nh8 Kd8 125. Kc3 Kc8 126. Kc4 Kd7 127. Kd5 Ke8 128. Kd4 Kf8
 (2 rows)
*/

SELECT COUNT(*) FROM chessgame WHERE hasopening(pgn,'1. e4 d6');
/*
Output
 SELECT count(*) FROM chessgame WHERE hasopening(pgn,'1. e4 d6') LIMIT 10;
 count
-------
    27
(1 row)
*/




--  Validate hasBoard(chess_game,chess_board,integer) Functionality -------------------------------------------
SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    1
);
/*
 hasboard
----------
 f
(1 row)
*/

SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    2
);
/*
 hasboard
----------
 f
(1 row)
*/

SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    3
);
/*
 hasboard
----------
 f
(1 row)
*/

SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    4
);
/*
 hasboard
----------
 f
(1 row)
*/

SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    5
);
/*
 hasboard
----------
 t
(1 row)
*/

SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    6
);
/*
 hasboard
----------
 t
(1 row)
*/


-- Only board state is considered, anything apart from that is ignored
SELECT hasboard('1. e4 e5
2. Nf3 Nc6
3. Bb5 a6
4. Ba4 Nf6
5. d3'::chess_game,'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2'::chess_board,4);
/*
 hasboard
----------
 t
(1 row)
*/

SELECT hasboard('1. e4 e5
2. Nf3 Nc6
3. Bb5 a6
4. Ba4 Nf6
5. d3'::chess_game,'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2'::chess_board,4);
/*
 hasboard
----------
 t
(1 row)
*/




--- Return all the game from table chessgame which had chessboard state rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2 within first 5 half moves
SELECT * FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2',5);
/*
Output
pgn
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 1. e3 e5 2. e4 d5 3. b4 Nh6 4. Be2 c5 5. Bf3 Qd7 6. Nh3 Ke7 7. Ng1 Qc7 8. Ne2 Nf5 9. Nbc3 Be6 10. b5 Qc6 11. d4 Qa6 12. g4 Nh4 13. h3 Qb6 14. Qd2 Kd7 15. Qf4 g5 16. Qf5 h5 17. Na4 dxe4 18. d5 Qd8 19. Nd4 Qc8 20. Bd2 Kc7 21. Rb1 Bd7 22. Be3 Kd8 23. Qf4 Nc6 24. gxh5 Nxd4 25. Bd1 g4 26. Qf3 Nb3 27. hxg4 Qc7 28. Nxc5 Na5 29. Qe2 Qb6 30. Bf4 Bxg4 31. Nxb7+ Ke8 32. Ra1 Bxe2 33. Rxh4 Rh7 34. Kxe2 Rb8 35. Rh1 Qc7 36. a3 Nc4 37. Bg5 Qa5 38. a4 Bb4 39. Rh4 f6 40. f4 Nd2 41. h6 Nb3 42. Nxa5 e3 43. Nb7 Be7 44. Rh3 Nc1+ 45. Ke1 Rh8 46. Ra3 Rxh6 47. Rh1 Bb4+ 48. Rc3 Kd7 49. Kf1 exf4 50. Kg1 Rh7 51. Bh6 Rd8 52. Nc5+ Kd6 53. Nb3 Nd3 54. Na5 Nc5 55. Bg4 Na6 56. Bd1 f3 57. Ra3 Nc5 58. Rxe3 Ra8 59. Ra3 Bxa3 60. Rh4 Nb7 61. Rh2 Re7 62. Nc4+ Kxd5 63. Ne3+ Ke5 64. Nf5 Rd8 65. Bf8 Rb8 66. Ne3 Kd4 67. Nd5 Re5 68. Kf2 Kc4 69. Nf4 Bd6 70. c3 Be7 71. Rh1 Na5 72. Nh5 Rxh5 73. Bh6 Kd3 74. Rh4 a6 75. b6 Nc6 76. Bg7 Na7 77. Bxf3 Rb7 78. Bg2 Rb5 79. Be4+ Kd2 80. c4 Bd6 81. c5 a5 82. Rh6 Kc1 83. Ke2 Bf4 84. Rh7 Rb8 85. Ke1 R8xb6 86. Kf1 Rb4 87. Rh1 Rd6 88. Rh5 Nc6 89. Kg1 Rd7 90. Rh1 Kb2 91. Kg2 Bc7 92. Bh8 Nd8 93. Rd1 Ka2 94. Rh1 Rd1 95. Bb1+ Rdxb1 96. Kf3 Bb8 97. Rxb1 Rb2 98. Kg4 Rb4+ 99. Kh5 Rh4+ 100. Kxh4 Ne6 101. Rxb8 Ng7 102. Rf8 Kb2 103. Rxf6 Kc3 104. Rb6 Kc2 105. Rg6 Kb2 106. Rf6 Kb3 107. Bxg7 Kc4 108. Bf8 Kb4 109. Rf4+ Kb3 110. Rc4 Ka3 111. Be7 Ka2 112. Rb4 axb4 113. Kg4 Kb1 114. Kh5 Ka1 115. Kh6 Ka2 116. Bd6 Kb1 117. Bg3 Kc1 118. Be5 Kd2 119. Bg3 Ke3 120. Bb8 Kf2 121. Kh7 Kf1 122. Bh2 Kf2 123. Kg7 Ke2 124. Bb8 Kd2 125. Kh6 Kc3 126. Be5+ Kb3 127. Kg7 Kxa4 128. Kf6 Kb5
 1. e4 e5 2. Bd3 b5 3. h4 f5 4. Qe2 a5 5. a3 Na6 6. Qg4 Bb4 7. Qxg7 Nc5 8. Bf1 Ra6 9. Qh6 Rf6 10. Ne2 Rc6 11. Qe6+ Kf8 12. Qe7+ Qxe7 13. Rg1 Na6 14. g4 Rd6 15. Bh3 Qxh4 16. Ng3 fxg4 17. Nh5 Bxd2+ 18. Kd1 Bc3+ 19. Nd2 Rf6 20. b4 Qg5 21. f4 Bb2 22. Bxg4 a4 23. f5 Qg7 24. Bf3 Nc5 25. Be2 Qh6 26. Ke1 Bxa1 27. bxc5 b4 28. Bg4 Ba6 29. Bd1 Bc3 30. Rg5 Rxf5 31. c6 Qxg5 32. Bb2 Bxd2#
 1. e4 e5 2. Bb5 f6 3. Qf3 g5 4. Qe2 Kf7 5. Qg4 d6 6. Bf1 b5 7. c4 b4 8. d3 Bh6 9. Qe6+ Kg6 10. Qe7 Nc6 11. Kd2 Bg7 12. Kc2 Qd7 13. Qe6 Na5 14. Bxg5 Qb5 15. Be2 Ba6 16. Be3 Nb3 17. Qe7 Rb8 18. Kd1 Ra8 19. f4 Kh6 20. f5#
*/

--- Return number of games from table chessgame which had chessboard state rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2 within first 5 half moves
SELECT COUNT(*) FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2',5);
/*
Output
 count
-------
    33
(1 row)
*/




----------------- Validation of creation of BTree index ------------------------
SET enable_seqscan=ON;
/*
SET
*/

EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasOpening(pgn,'1. e3 b5');
/*
                                                   QUERY PLAN
-----------------------------------------------------------------------------------------------------------------
 Seq Scan on chessgame  (cost=0.00..817.08 rows=2501 width=512) (actual time=689.440..11197.379 rows=28 loops=1)
   Filter: ((pgn >= '1. e3 b5'::chess_game) AND (pgn < '1. e3 b5'::chess_game))
   Rows Removed by Filter: 9972
 Planning Time: 0.102 ms
 Execution Time: 11197.420 ms
(5 rows)
*/

CREATE INDEX idx_btree ON chessgame using btree(pgn);
/*
Output
CREATE INDEX
*/

SET enable_seqscan=OFF;
/*
SET
*/

EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasOpening(pgn,'1. e3 b5');
/*
Output
                                                          QUERY PLAN
------------------------------------------------------------------------------------------------------------------------------
 Index Only Scan using idx on chessgame  (cost=0.54..906.53 rows=2500 width=512) (actual time=19.503..77.812 rows=28 loops=1)
   Index Cond: ((pgn >= '1. e3 b5'::chess_game) AND (pgn < '1. e3 b5'::chess_game))
   Heap Fetches: 0
 Planning Time: 0.760 ms
 Execution Time: 77.939 ms
(5 rows)
 */



------------------------ Validation of creation of GIN Index -------------------------------
DROP INDEX idx_btree;

SET enable_seqscan=ON;
/*
SET
*/

EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2',10);
/*
                                                                  QUERY PLAN
----------------------------------------------------------------------------------------------------------------------------------------------
 Seq Scan on chessgame  (cost=0.00..817.08 rows=5002 width=512) (actual time=601.504..8065.450 rows=3 loops=1)
   Filter: (pgn @> concat('10'::character varying, ',', 'rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2'::character varying))
   Rows Removed by Filter: 9997
 Planning Time: 0.262 ms
 Execution Time: 8065.474 ms
(5 rows)
*/

CREATE INDEX idx_gin ON chessgame using gin(pgn);
/*
Output
CREATE INDEX
*/


-- Not needed though since GIN Index is automatically being picked
SET enable_seqscan=OFF; 
/*
SET
*/

EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2',10);
/*
Output
                                                                       QUERY PLAN
--------------------------------------------------------------------------------------------------------------------------------------------------------
 Bitmap Heap Scan on chessgame  (cost=66.75..808.75 rows=5000 width=512) (actual time=0.041..0.064 rows=3 loops=1)
   Recheck Cond: (pgn @> concat('10'::character varying, ',', 'rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2'::character varying))
   Heap Blocks: exact=3
   ->  Bitmap Index Scan on idx  (cost=0.00..65.50 rows=5000 width=0) (actual time=0.035..0.036 rows=3 loops=1)
         Index Cond: (pgn @> concat('10'::character varying, ',', 'rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2'::character varying))
 Planning Time: 1.407 ms
 Execution Time: 0.096 ms
(7 rows)
 */


-- If board state is initial, it should be present in every chess game
EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',10);
/*
                                                                    QUERY PLAN
--------------------------------------------------------------------------------------------------------------------------------------------------
 Bitmap Heap Scan on chessgame  (cost=66.75..808.75 rows=5000 width=512) (actual time=0.726..3.026 rows=10000 loops=1)
   Recheck Cond: (pgn @> concat('10'::character varying, ',', 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'::character varying))
   Heap Blocks: exact=667
   ->  Bitmap Index Scan on idx  (cost=0.00..65.50 rows=5000 width=0) (actual time=0.668..0.668 rows=10000 loops=1)
         Index Cond: (pgn @> concat('10'::character varying, ',', 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'::character varying))
 Planning Time: 0.147 ms
 Execution Time: 3.317 ms
(7 rows)
*/