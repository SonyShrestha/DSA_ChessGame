----------------- Validation of creation of BTree index ------------------------
EXPLAIN ANALYZE SELECT * FROM chessgame WHERE hasOpening(pgn,'1. e3 b5');
/*
Output
                                                   QUERY PLAN
----------------------------------------------------------------------------------------------------------------
 Seq Scan on chessgame  (cost=0.00..792.00 rows=3333 width=512) (actual time=179.434..7950.004 rows=50 loops=1)
   Filter: hasopening(pgn, '1. e3 b5'::chess_game)
   Rows Removed by Filter: 9950
 Planning Time: 0.170 ms
 Execution Time: 7950.044 ms
(5 rows)
*/


CREATE INDEX idx ON chessgame(pgn);
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
----------------------------------------------------------------------------------------------------------------------------------
 Index Only Scan using idx on chessgame  (cost=0.54..3571.53 rows=3333 width=512) (actual time=180.938..8657.647 rows=50 loops=1)
   Filter: hasopening(pgn, '1. e3 b5'::chess_game)
   Rows Removed by Filter: 9950
   Heap Fetches: 0
 Planning Time: 0.047 ms
 Execution Time: 8657.693 ms
 */