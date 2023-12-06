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

CREATE INDEX idx ON chessgame using gin(pgn);
/*
Output
CREATE INDEX
*/

SET enable_seqscan=OFF;
/*
Output
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
         Index Cond: (pgn @@ concat('10'::character varying, ',', 'rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2'::character varying))
 Planning Time: 1.407 ms
 Execution Time: 0.096 ms
(7 rows)
 */



-- If board state is initial, it should be present in every chess game
EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2',10);
/*
                                                                    QUERY PLAN
--------------------------------------------------------------------------------------------------------------------------------------------------
 Bitmap Heap Scan on chessgame  (cost=66.75..808.75 rows=5000 width=512) (actual time=0.726..3.026 rows=10000 loops=1)
   Recheck Cond: (pgn @@ concat('10'::character varying, ',', 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'::character varying))
   Heap Blocks: exact=667
   ->  Bitmap Index Scan on idx  (cost=0.00..65.50 rows=5000 width=0) (actual time=0.668..0.668 rows=10000 loops=1)
         Index Cond: (pgn @@ concat('10'::character varying, ',', 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'::character varying))
 Planning Time: 0.147 ms
 Execution Time: 3.317 ms
(7 rows)
*/
