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