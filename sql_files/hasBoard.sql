
------------------------------------------- Validate hasBoard(chess_game,chess_board,integer) Functionality -------------------------------------------
/*
Returns true if the chessgame contains the given board state in its first N half-moves 
comparing only the state of the pieces and not comparing the move count, castling right, en passant piece
*/

----------------------- Test Case 1
/*
For chess game 
1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4
board state 
r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3
is reached after 5th half move 
So, when hasBoard function is called with given chess game and chess board as first and second parameter and 
if third parameter is < 5, it should return False 
if third parameter is >= 5, it should return True 
*/

SELECT
hasBoard(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4',
    'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3',
    1
);
/*
Output
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
Output
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
Output
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
Output
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
Output
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
Output
 hasboard
----------
 t
(1 row)
*/



-------------------------------------- Test Case 2
/*
For chess game 
1. e4 c5 2. Nf3 Nc6 3. d4 cxd4 4. Nxd4 g6 5. Nc3 Bg7 6. Be3 Nf6
7. Bc4 O-O 8. Bb3 d6 9. f3 Bd7 10. Qd2 Rc8 11. O-O-O Ne5 12. Kb1 Nc4
13. Bxc4 Rxc4 14. g4 Re8 15. h4 h5 16. gxh5 Nxh5 17. Rhg1 Kh7 18. Rg5
e5 19. Nde2 Be6 20. Rdg1 Bf6 21. Ng3 Nf4 22. Bxf4 exf4 23. Qxf4 Rxc3
24. bxc3 Qb6+ 25. Kc1 Qxg1+ 26. Kb2 Qb6+ 27. Kc1 Bxg5 28. Qxg5 Qg1+
29. Kb2 Qb6+ 30. Kc1 Qc5 31. Qf6 Qe5 32. Qxe5 dxe5 33. a3 Rc8 34. Kb2
Rc6 35. Nf1 Rb6+ 36. Kc1 Ba2 37. Ne3 Rb1+ 38. Kd2 Ra1 39. c4 b6
40. Kc3 Re1 41. Kd2 Rh1 42. Kc3 Rxh4 43. Kb2 Rh3 44. Kxa2 Rxf3
45. Nd5 g5 46. Kb2 g4 47. Kc1 g3 48. Kd2 g2 0.5-0.5
board state 
rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2
is reached after 2nd half move 
So, when hasBoard function is called with given chess game and chess board as first and second parameter and 
if third parameter is < 2, it should return False 
if third parameter is >= 2, it should return True 
*/

SELECT hasBoard(
    '1. e4 c5 2. Nf3 Nc6 3. d4 cxd4 4. Nxd4 g6 5. Nc3 Bg7 6. Be3 Nf6
    7. Bc4 O-O 8. Bb3 d6 9. f3 Bd7 10. Qd2 Rc8 11. O-O-O Ne5 12. Kb1 Nc4
    13. Bxc4 Rxc4 14. g4 Re8 15. h4 h5 16. gxh5 Nxh5 17. Rhg1 Kh7 18. Rg5
    e5 19. Nde2 Be6 20. Rdg1 Bf6 21. Ng3 Nf4 22. Bxf4 exf4 23. Qxf4 Rxc3
    24. bxc3 Qb6+ 25. Kc1 Qxg1+ 26. Kb2 Qb6+ 27. Kc1 Bxg5 28. Qxg5 Qg1+
    29. Kb2 Qb6+ 30. Kc1 Qc5 31. Qf6 Qe5 32. Qxe5 dxe5 33. a3 Rc8 34. Kb2
    Rc6 35. Nf1 Rb6+ 36. Kc1 Ba2 37. Ne3 Rb1+ 38. Kd2 Ra1 39. c4 b6
    40. Kc3 Re1 41. Kd2 Rh1 42. Kc3 Rxh4 43. Kb2 Rh3 44. Kxa2 Rxf3
    45. Nd5 g5 46. Kb2 g4 47. Kc1 g3 48. Kd2 g2 0.5-0.5',
    'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2',
    0
);
/* 
Output
 hasboard
----------
 f
(1 row)
*/


SELECT hasBoard(
    '1. e4 c5 2. Nf3 Nc6 3. d4 cxd4 4. Nxd4 g6 5. Nc3 Bg7 6. Be3 Nf6
    7. Bc4 O-O 8. Bb3 d6 9. f3 Bd7 10. Qd2 Rc8 11. O-O-O Ne5 12. Kb1 Nc4
    13. Bxc4 Rxc4 14. g4 Re8 15. h4 h5 16. gxh5 Nxh5 17. Rhg1 Kh7 18. Rg5
    e5 19. Nde2 Be6 20. Rdg1 Bf6 21. Ng3 Nf4 22. Bxf4 exf4 23. Qxf4 Rxc3
    24. bxc3 Qb6+ 25. Kc1 Qxg1+ 26. Kb2 Qb6+ 27. Kc1 Bxg5 28. Qxg5 Qg1+
    29. Kb2 Qb6+ 30. Kc1 Qc5 31. Qf6 Qe5 32. Qxe5 dxe5 33. a3 Rc8 34. Kb2
    Rc6 35. Nf1 Rb6+ 36. Kc1 Ba2 37. Ne3 Rb1+ 38. Kd2 Ra1 39. c4 b6
    40. Kc3 Re1 41. Kd2 Rh1 42. Kc3 Rxh4 43. Kb2 Rh3 44. Kxa2 Rxf3
    45. Nd5 g5 46. Kb2 g4 47. Kc1 g3 48. Kd2 g2 0.5-0.5',
    'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2',
    1
);
/* 
Output
 hasboard
----------
 f
(1 row)
*/


SELECT hasBoard(
    '1. e4 c5 2. Nf3 Nc6 3. d4 cxd4 4. Nxd4 g6 5. Nc3 Bg7 6. Be3 Nf6
    7. Bc4 O-O 8. Bb3 d6 9. f3 Bd7 10. Qd2 Rc8 11. O-O-O Ne5 12. Kb1 Nc4
    13. Bxc4 Rxc4 14. g4 Re8 15. h4 h5 16. gxh5 Nxh5 17. Rhg1 Kh7 18. Rg5
    e5 19. Nde2 Be6 20. Rdg1 Bf6 21. Ng3 Nf4 22. Bxf4 exf4 23. Qxf4 Rxc3
    24. bxc3 Qb6+ 25. Kc1 Qxg1+ 26. Kb2 Qb6+ 27. Kc1 Bxg5 28. Qxg5 Qg1+
    29. Kb2 Qb6+ 30. Kc1 Qc5 31. Qf6 Qe5 32. Qxe5 dxe5 33. a3 Rc8 34. Kb2
    Rc6 35. Nf1 Rb6+ 36. Kc1 Ba2 37. Ne3 Rb1+ 38. Kd2 Ra1 39. c4 b6
    40. Kc3 Re1 41. Kd2 Rh1 42. Kc3 Rxh4 43. Kb2 Rh3 44. Kxa2 Rxf3
    45. Nd5 g5 46. Kb2 g4 47. Kc1 g3 48. Kd2 g2 0.5-0.5',
    'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2',
    2
);
/* Output
 hasboard
----------
 t
(1 row)
*/


SELECT hasBoard(
    '1. e4 c5 2. Nf3 Nc6 3. d4 cxd4 4. Nxd4 g6 5. Nc3 Bg7 6. Be3 Nf6
    7. Bc4 O-O 8. Bb3 d6 9. f3 Bd7 10. Qd2 Rc8 11. O-O-O Ne5 12. Kb1 Nc4
    13. Bxc4 Rxc4 14. g4 Re8 15. h4 h5 16. gxh5 Nxh5 17. Rhg1 Kh7 18. Rg5
    e5 19. Nde2 Be6 20. Rdg1 Bf6 21. Ng3 Nf4 22. Bxf4 exf4 23. Qxf4 Rxc3
    24. bxc3 Qb6+ 25. Kc1 Qxg1+ 26. Kb2 Qb6+ 27. Kc1 Bxg5 28. Qxg5 Qg1+
    29. Kb2 Qb6+ 30. Kc1 Qc5 31. Qf6 Qe5 32. Qxe5 dxe5 33. a3 Rc8 34. Kb2
    Rc6 35. Nf1 Rb6+ 36. Kc1 Ba2 37. Ne3 Rb1+ 38. Kd2 Ra1 39. c4 b6
    40. Kc3 Re1 41. Kd2 Rh1 42. Kc3 Rxh4 43. Kb2 Rh3 44. Kxa2 Rxf3
    45. Nd5 g5 46. Kb2 g4 47. Kc1 g3 48. Kd2 g2 0.5-0.5',
    'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2',
    3
);
/*
Output
 hasboard
----------
 t
(1 row)
*/





----------------------------- Test Case 3 -------------------------------------------
-- Only board state is considered, anything apart from that is ignored
SELECT hasboard('1. e4 e5
2. Nf3 Nc6
3. Bb5 a6
4. Ba4 Nf6
5. d3'::chess_game,'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2'::chess_board,4);
/*
Output
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
Output
 hasboard
----------
 t
(1 row)
*/