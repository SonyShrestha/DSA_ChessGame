-- Copy command to load sample PGN into chessgame table
DROP TABLE IF EXISTS chessgame;

CREATE TABLE chessgame(pgn chess_game);

COPY chessgame(pgn)
FROM '/mnt/c/ULB/Database Systems Architecture/Project/git/DSA_ChessGame/sample_pgn10000.csv'
DELIMITER ','
CSV HEADER;