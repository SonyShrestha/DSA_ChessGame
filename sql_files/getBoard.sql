------------------------------------ Validate getBoard functionality ---------------------------------
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