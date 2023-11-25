------------------------------------ Validate getFirstMoves functionality ---------------------------------
/*
Returns the chessgame truncated to its first N half-moves
*/

SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', 0);
/*
Output
 getfirstmoves
---------------

(1 row)
*/


SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', 1);
/*
Output
 getfirstmoves
---------------
 1. e4
(1 row)
*/


SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',2);
/*
Output
 getfirstmoves
---------------
 1. e4 e5
(1 row)
*/


SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',3);
/*
Output
  getfirstmoves
-----------------
 1. e4 e5 2. Nf3
(1 row)
*/


SELECT getFirstMoves('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3',4);
/*
Output
    getfirstmoves
---------------------
 1. e4 e5 2. Nf3 Nc6
(1 row)
*/