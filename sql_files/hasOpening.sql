------------------------------------ Validate hasOpening(chess_game,chess_game) functionality ---------------------------------
/*
Returns true if the first chess game starts with the exact same set of moves as the second chess game.
*/

SELECT hasOpening('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', '1. e4 e5 2. Nf3 Nc6');
/* 
Output
 hasopening
------------
 t
(1 row)
*/


SELECT hasOpening('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. d3', '1. Nf3 c6 2. a3 d6');
/* 
Output
 hasopening
------------
 f
(1 row)
*/