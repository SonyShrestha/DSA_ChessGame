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

CREATE INDEX idx ON chessgame using btree(pgn);
/*
Output
CREATE INDEX
*/

SET enable_seqscan=OFF;
/*
Output
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