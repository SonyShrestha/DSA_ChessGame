
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





--- Return all the game from table chessgame which had chessboard state rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2 within first 5 half moves
SELECT * FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2',5);
/*
Output
pgn
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 1. e3 e5 2. e4 d5 3. b4 Nh6 4. Be2 c5 5. Bf3 Qd7 6. Nh3 Ke7 7. Ng1 Qc7 8. Ne2 Nf5 9. Nbc3 Be6 10. b5 Qc6 11. d4 Qa6 12. g4 Nh4 13. h3 Qb6 14. Qd2 Kd7 15. Qf4 g5 16. Qf5 h5 17. Na4 dxe4 18. d5 Qd8 19. Nd4 Qc8 20. Bd2 Kc7 21. Rb1 Bd7 22. Be3 Kd8 23. Qf4 Nc6 24. gxh5 Nxd4 25. Bd1 g4 26. Qf3 Nb3 27. hxg4 Qc7 28. Nxc5 Na5 29. Qe2 Qb6 30. Bf4 Bxg4 31. Nxb7+ Ke8 32. Ra1 Bxe2 33. Rxh4 Rh7 34. Kxe2 Rb8 35. Rh1 Qc7 36. a3 Nc4 37. Bg5 Qa5 38. a4 Bb4 39. Rh4 f6 40. f4 Nd2 41. h6 Nb3 42. Nxa5 e3 43. Nb7 Be7 44. Rh3 Nc1+ 45. Ke1 Rh8 46. Ra3 Rxh6 47. Rh1 Bb4+ 48. Rc3 Kd7 49. Kf1 exf4 50. Kg1 Rh7 51. Bh6 Rd8 52. Nc5+ Kd6 53. Nb3 Nd3 54. Na5 Nc5 55. Bg4 Na6 56. Bd1 f3 57. Ra3 Nc5 58. Rxe3 Ra8 59. Ra3 Bxa3 60. Rh4 Nb7 61. Rh2 Re7 62. Nc4+ Kxd5 63. Ne3+ Ke5 64. Nf5 Rd8 65. Bf8 Rb8 66. Ne3 Kd4 67. Nd5 Re5 68. Kf2 Kc4 69. Nf4 Bd6 70. c3 Be7 71. Rh1 Na5 72. Nh5 Rxh5 73. Bh6 Kd3 74. Rh4 a6 75. b6 Nc6 76. Bg7 Na7 77. Bxf3 Rb7 78. Bg2 Rb5 79. Be4+ Kd2 80. c4 Bd6 81. c5 a5 82. Rh6 Kc1 83. Ke2 Bf4 84. Rh7 Rb8 85. Ke1 R8xb6 86. Kf1 Rb4 87. Rh1 Rd6 88. Rh5 Nc6 89. Kg1 Rd7 90. Rh1 Kb2 91. Kg2 Bc7 92. Bh8 Nd8 93. Rd1 Ka2 94. Rh1 Rd1 95. Bb1+ Rdxb1 96. Kf3 Bb8 97. Rxb1 Rb2 98. Kg4 Rb4+ 99. Kh5 Rh4+ 100. Kxh4 Ne6 101. Rxb8 Ng7 102. Rf8 Kb2 103. Rxf6 Kc3 104. Rb6 Kc2 105. Rg6 Kb2 106. Rf6 Kb3 107. Bxg7 Kc4 108. Bf8 Kb4 109. Rf4+ Kb3 110. Rc4 Ka3 111. Be7 Ka2 112. Rb4 axb4 113. Kg4 Kb1 114. Kh5 Ka1 115. Kh6 Ka2 116. Bd6 Kb1 117. Bg3 Kc1 118. Be5 Kd2 119. Bg3 Ke3 120. Bb8 Kf2 121. Kh7 Kf1 122. Bh2 Kf2 123. Kg7 Ke2 124. Bb8 Kd2 125. Kh6 Kc3 126. Be5+ Kb3 127. Kg7 Kxa4 128. Kf6 Kb5
 1. e4 e5 2. Bd3 b5 3. h4 f5 4. Qe2 a5 5. a3 Na6 6. Qg4 Bb4 7. Qxg7 Nc5 8. Bf1 Ra6 9. Qh6 Rf6 10. Ne2 Rc6 11. Qe6+ Kf8 12. Qe7+ Qxe7 13. Rg1 Na6 14. g4 Rd6 15. Bh3 Qxh4 16. Ng3 fxg4 17. Nh5 Bxd2+ 18. Kd1 Bc3+ 19. Nd2 Rf6 20. b4 Qg5 21. f4 Bb2 22. Bxg4 a4 23. f5 Qg7 24. Bf3 Nc5 25. Be2 Qh6 26. Ke1 Bxa1 27. bxc5 b4 28. Bg4 Ba6 29. Bd1 Bc3 30. Rg5 Rxf5 31. c6 Qxg5 32. Bb2 Bxd2#
 1. e4 e5 2. Bb5 f6 3. Qf3 g5 4. Qe2 Kf7 5. Qg4 d6 6. Bf1 b5 7. c4 b4 8. d3 Bh6 9. Qe6+ Kg6 10. Qe7 Nc6 11. Kd2 Bg7 12. Kc2 Qd7 13. Qe6 Na5 14. Bxg5 Qb5 15. Be2 Ba6 16. Be3 Nb3 17. Qe7 Rb8 18. Kd1 Ra8 19. f4 Kh6 20. f5#
*/


--- Return number of games from table chessgame which had chessboard state rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2 within first 5 half moves
SELECT COUNT(*) FROM chessgame WHERE hasBoard(pgn,'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2',5);
/*
Output
 count
-------
    33
(1 row)
*/
