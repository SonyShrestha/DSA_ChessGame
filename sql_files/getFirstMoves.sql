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





-------------------- Return first 3 half moves of all games present in table chessgame ----------------------
SELECT getFirstMoves(pgn,3),pgn FROM chessgame limit 10;
/*
Output
 pgn                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 1. a4 h6 2. h4  | 1. a4 h6 2. h4 b6 3. Nf3 Rh7 4. b3 Nf6 5. Nc3 Bb7 6. d4 d5 7. a5 Nc6 8. Bg5 Qd6 9. Rh2 Rh8 10. e3 Nh5 11. Ra2 f5 12. a6 Nf4 13. Bc4 O-O-O 14. Bxh6 Ba8 15. Ra3 Na5 16. Bd3 Nxb3 17. Na2 Nxd4 18. Nc3 e5 19. Qb1 Nfe2 20. Qd1 Nb3 21. Bf4 Nbc1 22. Bc4 Qc5 23. Ba2 Qa5 24. g4 Nb3 25. Rxa5 Nc5 26. Ne4 exf4 27. Kf1 fxe3 28. Ned2 Rd6 29. Ra3 Kb8 30. Bc4 Be7 31. Qb1 Rh7 32. h5 g5 33. Qb2 Rd8 34. Ne1 Nd7 35. f3 Nf4 36. Qb1 b5 37. Rh4 exd2 38. Be2 d1=R 39. Ra4 Rf7 40. Rxf4 Bc5 41. Qc1 Rf6 42. Rh2 Be3 43. Qa1 Rc8 44. Qa3 Bc5 45. Qc1 Be7 46. Re4 Rc6 47. Qb1 d4 48. Qa1 Bf8 49. Re7 Nf6 50. Qc3 f4 51. Re6 Be7 52. Rg2 Rf8 53. Qa3 Rb6 54. Qb4 Rd2 55. Rf2 Rg8 56. Rxf6 Rxa6 57. Qa4 Rg7 58. Bxb5 Ba3 59. Bd3 Rxc2 60. Rf5 Rf6 61. Qa5 Rfc6 62. Qd2 R2c5 63. Bc2 Ra5 64. Qc3 Rf7 65. Qa1 Kc8 66. Be4 R6c5 67. Rf6 Rxf6 68. Bc6 Rf7 69. Bb7+ Kd8 70. Bc6 Bb4 71. Ke2 Re5+ 72. Kd1 Re2 73. Bd7 Kxd7 74. Qa3 Bd5 75. Qa2 Ba8 76. h6 Rb2 77. Qb1 Ke6 78. Qc1 Kf6 79. Rxb2 Bf8 80. Qe3 Kg6 81. Rd2 Bxh6 82. Rd3 c6 83. Qe5 Rf5 84. Qb5 Kf7 85. Rd2 Kg6 86. Qa4 Bb7 87. Qa1 Ra4 88. Rc2 Rb4 89. Ke2 a6 90. Rb2 Ba8 91. Ra2 Rb6 92. Ra3 d3+ 93. Rxd3 Rc5 94. Qd1 Bb7 95. Qa4 Kf7 96. Qxa6 Rc4 97. Rd8 R6b4 98. Kd2 Kg7 99. Ke2 Rc1 100. Qb5 Rb2+ 101. Nc2 R2b1 102. Qd3 Rb3 103. Rd5 Kf7 104. Qh7+ Kf8 105. Ne3 Rbc3 106. Rc5 Rd3 107. Nf5 Rc4 108. Qe7+ Kg8 109. Rxc6 Rd7 110. Ng3 R7d4 111. Qf8+ Kh7 112. Rc8 Be4 113. Nh1 Rc6 114. Qb4 Rcd6 115. Ke1 Bc6 116. Rg8 R6d5 117. Qc4 Rd3 118. Rd8 Rb3 119. Qxc6 Rb6 120. Ke2 R6b5 121. Rxd5 Rb1 122. Qc7+ Kg8 123. Rc5 Kh8 124. Rb5 Kg8 125. Qc3 Rb4 126. Qc6 Rd4 127. Qe8+ Kg7 128. Qc8 Rd3
 1. g4 a6 2. c3  | 1. g4 a6 2. c3 Nh6 3. h4 e5 4. Nf3 a5 5. b4 Nc6 6. g5 Ne7 7. bxa5 Rg8 8. g6 b5 9. Ba3 Ba6 10. Bd6 Qb8 11. Nd4 Ra7 12. Bb4 hxg6 13. Qc1 Nef5 14. Qa3 d5 15. e4 Nxd4 16. Bc5 Bb7 17. Be7 Ra8 18. d3 g5 19. Qc1 g4 20. Na3 g5 21. Rb1 Qd8 22. Nxb5 Rb8 23. Na7 Bxe7 24. Kd2 Ba3 25. Rg1 c6 26. Rxg4 Bd6 27. Bg2 Bc7 28. Rb2 Qf6 29. Rg3 Qe7 30. Rb4 Ndf5 31. Rb3 Rd8 32. Qd1 Bc8 33. a6 Bb7 34. Rxg5 Qa3 35. Qa1 Qc5 36. Rxg8+ Kd7 37. Qg1 Qc4 38. Ra3 Ke7 39. Ra5 f6 40. Rb5 Ne3 41. Bh3 dxe4 42. Kc1 Qxc3+ 43. Kb1 Neg4 44. Bf1 Nf7 45. Re8+ Kd6 46. dxe4 Ra8 47. axb7 f5 48. Rg8 c5 49. b8=R Qg3 50. Rge8 Qxf2 51. a4 Qf3 52. R8b7 Rxa7 53. R5b6+ Bxb6 54. Qxg4 Rxa4 55. Qxf3 Nh8 56. Ba6 Ra3 57. Qg2 Rc3 58. Bd3 Kc6 59. h5 f4 60. Ka2 Bc7 61. Rb2 f3 62. Qd2 Rc4 63. Rb1 Ng6 64. Rf1 Ra4+ 65. Kb1 Bb8 66. Rxb8 Ra6 67. Kc2 Ne7 68. Ra1 Kd6 69. Qc1 c4 70. Rc8 Ng6 71. Qe1 Ra8 72. Qc1 Ra4 73. Kd1 Nf4 74. Kd2 Ng6 75. Rd8+ Kc6 76. Qf1 Nh4 77. Rxa4 c3+ 78. Ke1 Kb6 79. Ra2 c2 80. Ra4 c1=Q+ 81. Kf2 Qxf1+ 82. Ke3 Qb1 83. Ra1 Qh1 84. Bc2 Qg1+ 85. Kd2 Qc5 86. Ra4 Qe3+ 87. Kd1 Kb5 88. Rda8 Qd4+ 89. Ke1 Ng6 90. Bb3 Qxe4+ 91. Kd2 Qb7 92. Kd3 Qd5+ 93. Ke3 Qd3+ 94. Kf2 Qe2+ 95. Kg1 Qe4 96. Rb8+ Kc5 97. Ra6 Qe3+ 98. Kf1 Qc3 99. Bf7 f2 100. Re8 Nh4 101. Rb6 Qa5 102. Bd5 Kxb6 103. Rf8 e4 104. Bc6 Qd5 105. Re8 Qg8 106. Rxg8 Kc5 107. Rb8 Kd6 108. Rf8 Kc7 109. Be8 Nf3 110. Rf7+ Kb8 111. Rf8 Ka8 112. Kg2 Ka7 113. Bb5 Ng5 114. Bf1 Nh3 115. Rf5 Ng1 116. Rf4 Nh3 117. Rf5 Ng5 118. Rxf2 Nf7 119. Kh2 Ng5 120. Rd2 Nf7 121. Rd3 Nh8 122. Rd5 Nf7 123. Kh3 Ka8 124. Ba6 Ne5 125. Rd2 Ka7 126. Kh2 Nd3 127. Bc8 Ka8 128. Bh3 Nc1
*/