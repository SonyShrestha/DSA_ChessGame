-- Drop extension if exists
DROP EXTENSION IF EXISTS chess_game cascade;

-- Create Extension 
CREATE EXTENSION chess_game;

-- Drop Table if exists
DROP TABLE IF EXISTS chessgame;

-- Create Table chessgame with a column containing chess_game
CREATE TABLE chessgame(pgn chess_game);

-- Load data into chessgame table 
-- sample_pgn10000.csv was generated using python code inside generateSamplePGN.py file
COPY chessgame(pgn)
FROM '/mnt/c/ULB/Database Systems Architecture/Project/git/DSA_ChessGame/sample_pgn10000.csv'
DELIMITER ','
CSV HEADER;




-- Drop Table chessboard if exists
DROP TABLE IF EXISTS chessboard;

-- Create Table chessboard
CREATE TABLE chessboard(fen chess_board);

-- Insert one row into chessboard table
INSERT INTO chessboard 
VALUES
('r2q1rk1/1b1pbppp/p4n2/1pp3B1/3pP3/PB1P4/1PP1NPPP/R2Q1RK1 b - - 1 12');

-- Read from chessboard table
SELECT * FROM chessboard;

-- Validate type cast operation from string to chess_board data type
SELECT 'r2q1rk1/1b1pbppp/p4n2/1pp3B1/3pP3/PB1P4/1PP1NPPP/R2Q1RK1 b - - 1 12'::chess_board;



-- Validate creating table with chess_game data type followed by insert and select statement 
-- Drop Table if exixts
DROP TABLE IF EXISTS chessgame1;

-- Create table chessgame1
CREATE TABLE chessgame1(pgn chess_game);

-- Insert into chessgame1
INSERT INTO chessgame1
VALUES('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4
11. Ne2 c5 12. Bg5 d5 13. Bxf6 Bxf6 14. Bxd5 Bxd5 15. exd5 Qxd5 16. Ng3 c4 17. Re1 Rae8 18. a4 Rxe1+ 19. Qxe1 cxd3 20. cxd3 bxa4
21. Qd1 Qb5 22. Ne4 Be7 23. Qc2 Rb8 24. Rxa4 Qxb2 25. Qxb2 Rxb2 26. g4 Rb6 27. Rxd4 Kf8 28. Rd7 Rg6 29. Kf1 Rxg4
30. Ra7 f5 31. Ng3 g6 32. Rxa6 Rh4 33. Kg2 Rd4 34. Ne2 Rxd3 35. Ng1 Rd7 36. Nf3 Kg7 37. h3 Bf6 38. Kg3 Rb7 39. Kg2 Re7
40. Ra5 Rc7 41. Rd5 Ra7 42. Rb5 Be7 43. Nd4 Rd7 44. Nf3 Rd6 45. Rb7 Kf6 46. Ra7 h6 47. Nh4 Bd8 48. Rh7 Rd2 49. Rxh6 Kg7
50. Rxg6+ Kh7 51. Nf3 Rxf2+ 52. Kxf2 Kxg6 53. Kg2 Kh5 54. Nd4 f4 55. Ne6 Bg5 56. Nxg5 Kxg5 57. Kf3 Kh4 58. Kxf4 Kxh3 1/2-1/2');

-- Read data from chessgame1
SELECT * FROM chessgame1;

-- Validate type cast operation from string to chess_game data type
SELECT 
'1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4 
11. Ne2 c5 12. Bg5 d5 13. Bxf6 Bxf6 14. Bxd5 Bxd5 15. exd5 Qxd5 16. Ng3 c4 17. Re1 Rae8 18. a4 Rxe1+ 19. Qxe1 cxd3 20. cxd3 bxa4 
21. Qd1 Qb5 22. Ne4 Be7 23. Qc2 Rb8 24. Rxa4 Qxb2 25. Qxb2 Rxb2 26. g4 Rb6 27. Rxd4 Kf8 28. Rd7 Rg6 29. Kf1 Rxg4 
30. Ra7 f5 31. Ng3 g6 32. Rxa6 Rh4 33. Kg2 Rd4 34. Ne2 Rxd3 35. Ng1 Rd7 36. Nf3 Kg7 37. h3 Bf6 38. Kg3 Rb7 39. Kg2 Re7 
40. Ra5 Rc7 41. Rd5 Ra7 42. Rb5 Be7 43. Nd4 Rd7 44. Nf3 Rd6 45. Rb7 Kf6 46. Ra7 h6 47. Nh4 Bd8 48. Rh7 Rd2 49. Rxh6 Kg7 
50. Rxg6+ Kh7 51. Nf3 Rxf2+ 52. Kxf2 Kxg6 53. Kg2 Kh5 54. Nd4 f4 55. Ne6 Bg5 56. Nxg5 Kxg5 57. Kf3 Kh4 58. Kxf4 Kxh3 1/2-1/2'::chess_game as pgn_notaion;




-- Return the board state at a given half-move
SELECT getBoard('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',0);

SELECT getBoard('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',1);

SELECT getBoard('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',2);

-- Return boardstate of all games present in table chessgame after 4 half moves
SELECT getBoard(pgn,4) FROM chessgame limit 10;




-- Validation of getFirstMoves function
SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', 0);

SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', 1);

SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',2);

SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',3);

SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',4);

-- Return first 3 half moves of all games present in table chessgame
SELECT getFirstMoves(pgn,3),pgn FROM chessgame limit 10;




-- Validation of hasOpening function
SELECT hasOpening('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', '1. e4 e5 2. Nf3 Nc6');

SELECT hasOpening('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', '1. Nf3 c6 2. a3 d6');


-- Return all games from the table chessgame which opened with moves given by 1. e4 d6 2. h4 h6 
SELECT * FROM chessgame WHERE hasOpening(pgn,'1. e4 d6') LIMIT 10;

SELECT COUNT(*) FROM chessgame WHERE hasopening(pgn,'1. e4 d6');





--  Validate hasBoard(chess_game,chess_board,integer) Functionality -------------------------------------------
SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    1
);

SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    2
);

SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    3
);

SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    4
);

SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    5
);

SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    6
);


-- Only board state is considered, anything apart from that is ignored
SELECT hasboard('1. e4 e5
2. Nf3 Nc6
3. Bb5 a6
4. Ba4 Nf6
5. d3'::chess_game,'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2'::chess_board,4);

SELECT hasboard('1. e4 e5
2. Nf3 Nc6
3. Bb5 a6
4. Ba4 Nf6
5. d3'::chess_game,'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2'::chess_board,4);





--- Return all the game from table chessgame which had chessboard state rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2 within first 5 half moves
SELECT * FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2',5);

--- Return number of games from table chessgame which had chessboard state rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2 within first 5 half moves
SELECT COUNT(*) FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2',5);




----------------- Validation of creation of BTree index ------------------------
-- Drop Table if exists
DROP TABLE IF EXISTS chessgame;

-- Create Table chessgame with a column containing chess_game
CREATE TABLE chessgame(pgn chess_game);

-- Load data into chessgame table 
-- sample_pgn10000.csv was generated using python code inside generateSamplePGN.py file
COPY chessgame(pgn)
FROM '/mnt/c/ULB/Database Systems Architecture/Project/git/DSA_ChessGame/sample_pgn10000.csv'
DELIMITER ','
CSV HEADER;

EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasOpening(pgn,'1. e3 b5');

CREATE INDEX idx ON chessgame(pgn);

SET enable_seqscan=OFF;

EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasOpening(pgn,'1. e3 b5');



------------------------ Validation of creation of GIN Index -------------------------------
----------------- Validation of creation of BTree index ------------------------
-- Drop Table if exists
DROP TABLE IF EXISTS chessgame;

-- Create Table chessgame with a column containing chess_game
CREATE TABLE chessgame(pgn chess_game);

-- Load data into chessgame table 
-- sample_pgn10000.csv was generated using python code inside generateSamplePGN.py file
COPY chessgame(pgn)
FROM '/mnt/c/ULB/Database Systems Architecture/Project/git/DSA_ChessGame/sample_pgn10000.csv'
DELIMITER ','
CSV HEADER;

EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2',10);

CREATE INDEX idx ON chessgame using gin(pgn);

-- Not needed though since GIN Index is automatically being picked
SET enable_seqscan=OFF; 

EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2',10);

-- If board state is initial, it should be present in every chess game
EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2',10);