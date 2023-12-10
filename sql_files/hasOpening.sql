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




-- Return all games from the table chessgame which opened with moves given by 1. e4 d6 
SELECT * FROM chessgame WHERE hasOpening(pgn,'1. e4 d6') LIMIT 2;
/*
Output
 1. e4 d6 2. g4 Nc6 3. Ke2 g6 4. Ke3 Bd7 5. a4 Bc8 6. Kf4 e6 7. Be2 Bh6+ 8. g5 Na5 9. Nf3 Kf8 10. Ne1 Bd7 11. gxh6 Bc6 12. Nc3 e5+ 13. Kg4 Nf6+ 14. Kg3 Ke7 15. Bd3 d5 16. b3 Ne8 17. Bc4 dxe4 18. Nf3 Rc8 19. Nb5 f5 20. c3 Qd6 21. Qe2 Qe6 22. Rf1 Bd7 23. Re1 c5 24. Ra3 f4+ 25. Kh4 Kf8 26. Nbd4 Qc6 27. Ra2 Nc7 28. Bf7 Ke7 29. Qc4 Bh3 30. Nxe5 Qe8 31. Rxe4 Qg8 32. Be6 b6 33. Qb5 Na8 34. Nf7 Bf5 35. Bxf5+ Kf8 36. Qxc5+ Rxc5 37. Re2 gxf5 38. Re3 Re5 39. Ng5 Re6 40. Bb2 Ke7 41. Ne2 Kf8 42. Re5 Rc6 43. d3 b5 44. d4 Qg6 45. Nxf4 Nb7 46. b4 Qg8 47. Bc1 Nc7 48. Ng2 a5 49. Rxf5+ Rf6 50. f3 Qc4 51. Kh5 Ke8 52. Re2+ Kd7 53. Nf4 axb4 54. axb5 Na6 55. Rc2 Qe6 56. d5 bxc3 57. Re2 Qe7 58. d6 Ke8 59. Rb2 Qe5 60. Rb1 Nb8 61. Nd3 Rxd6 62. Nxh7 Qd4 63. h3 c2 64. Rg5 Rg6 65. Nb4 Qg1 66. Rd5 Rf6 67. Na2 Qh1 68. Rd3 Nc5 69. Nb4 Kf7 70. Ng5+ Ke7 71. Ra1 Rh7 72. Ra2 Qxc1 73. Rd2 Na4 74. Nd3 Ke8 75. Nf4 Rd7 76. Ra3 Rc6 77. Ra2 Nb2 78. bxc6 Na6 79. Nge6 Qb1 80. Rxb2 Qa2 81. Rbxc2 Rxd2 82. c7 Rd1 83. Rb2 Rd4 84. Kh4 Ra4 85. c8=N Nc5 86. Rxa2 Nd3 87. Ra3 Rd4 88. Kg4 Re4 89. Rb3 Rb4 90. Kh4 Rb6 91. h7 Rb7 92. Rxb7 Ne5 93. h8=Q#
 1. e4 d6 2. c3 g5 3. Qa4+ b5 4. Qa5 g4 5. Qxa7 c6 6. d4 Be6 7. h4 h6 8. f3 Qc7 9. g3 Qd8 10. Kd2 Nd7 11. Rh3 Rh7 12. Bd3 gxh3 13. Kc2 Rb8 14. Kd1 b4 15. Qxb8 Nc5 16. a4 Rg7 17. Be2 Bd7 18. Bd2 Rxg3 19. Bd3 Qxb8 20. c4 Rg6 21. d5 Ne6 22. Ke2 Nc5 23. Na3 Qb7 24. Bf4 Rf6 25. Ra2 Na6 26. e5 c5 27. Bg3 e6 28. Ra1 bxa3 29. Bf4 Qxb2+ 30. Bc2 Nb4 31. Ke1 Bb5 32. Be4 Ne7 33. Rxa3 Rxf4 34. Bh7 Qc3+ 35. Kf2 f6 36. a5 Qxf3+ 37. Ke1 Qe4+ 38. Kd2 Qg2+ 39. Ke3 Ng6 40. Nf3 Na6 41. Nh2 Qc2 42. Rd3 Qxd3+ 43. Kxd3 Be7 44. exd6 h5 45. Kd2 Nb4 46. Ke2 Kf8 47. dxe7+ Kxe7 48. Ke1 Kd6 49. Bg8 Na2 50. Ng4 Bc6 51. Ne3 Rxc4 52. Ke2 Ne7 53. Ke1 Rc3 54. Nf5+ Ke5 55. Nxe7 Be8 56. Ke2 Bc6 57. Bf7 Rc2+ 58. Kd1 Bd7 59. Bg8 Ke4 60. Nc8 Bxc8 61. Bxe6 f5 62. Bd7 Kd3 63. Ba4 f4 64. Bd7 h2 65. Be6 Rf2 66. Bf5+ Kc4 67. Bh7 Rd2+ 68. Kxd2 Kb5 69. Bb1 Bb7 70. a6 Kc4 71. Bd3+ Kd4 72. Bf5 Bc8 73. a7 Kxd5 74. Be6+ Kd4 75. Bxa2 Bb7 76. a8=N Bh1 77. Nb6 c4 78. Bb1 Bb7 79. Nd5 h1=R 80. Be4 Kxe4 81. Nc3+ Kd4 82. Ne2+ Kd5 83. Kc2 c3 84. Nc1 Ba6 85. Nb3 Bd3+ 86. Kxd3 Ke5 87. Kxc3 Ra1 88. Nc5 Kd5 89. Nb3 Kc6 90. Nxa1 Kc5 91. Nb3+ Kb6 92. Kc2 Kc6 93. Nc1 Kd7 94. Kd2 f3 95. Ke3 Ke8 96. Kd4 Kf8 97. Kc4 Kg8 98. Nb3 Kg7 99. Nd2 f2 100. Kb3 f1=R 101. Nxf1 Kf7 102. Ka2 Kg7 103. Ne3 Kh6 104. Kb1 Kh7 105. Kb2 Kg8 106. Ka2 Kf7 107. Nc4 Kg7 108. Ne3 Kf7 109. Nf1 Ke6 110. Ne3 Kf6 111. Ng2 Ke7 112. Nf4 Kd6 113. Ka3 Ke5 114. Ng2 Ke6 115. Ka2 Ke7 116. Ne1 Kd7 117. Kb3 Ke7 118. Nf3 Kd8 119. Ne5 Kc7 120. Nc6 Kd6 121. Kb4 Kc7 122. Ne5 Kd8 123. Ng6 Kc8 124. Nh8 Kd8 125. Kc3 Kc8 126. Kc4 Kd7 127. Kd5 Ke8 128. Kd4 Kf8
 (2 rows)
*/

SELECT COUNT(*) FROM chessgame WHERE hasopening(pgn,'1. e4 d6');
/*
Output
 SELECT count(*) FROM chessgame WHERE hasopening(pgn,'1. e4 d6') LIMIT 10;
 count
-------
    27
(1 row)
*/
