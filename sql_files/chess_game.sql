-------------------------------------------------------- Implementation of Chess Game Data Type --------------------------------------------------------
-- Validate creating table with chess_game data type followed by insert and select statement 
CREATE TABLE chessgame1(pgn chess_game);

INSERT INTO chessgame1 
VALUES('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4
11. Ne2 c5 12. Bg5 d5 13. Bxf6 Bxf6 14. Bxd5 Bxd5 15. exd5 Qxd5 16. Ng3 c4 17. Re1 Rae8 18. a4 Rxe1+ 19. Qxe1 cxd3 20. cxd3 bxa4
21. Qd1 Qb5 22. Ne4 Be7 23. Qc2 Rb8 24. Rxa4 Qxb2 25. Qxb2 Rxb2 26. g4 Rb6 27. Rxd4 Kf8 28. Rd7 Rg6 29. Kf1 Rxg4
30. Ra7 f5 31. Ng3 g6 32. Rxa6 Rh4 33. Kg2 Rd4 34. Ne2 Rxd3 35. Ng1 Rd7 36. Nf3 Kg7 37. h3 Bf6 38. Kg3 Rb7 39. Kg2 Re7
40. Ra5 Rc7 41. Rd5 Ra7 42. Rb5 Be7 43. Nd4 Rd7 44. Nf3 Rd6 45. Rb7 Kf6 46. Ra7 h6 47. Nh4 Bd8 48. Rh7 Rd2 49. Rxh6 Kg7
50. Rxg6+ Kh7 51. Nf3 Rxf2+ 52. Kxf2 Kxg6 53. Kg2 Kh5 54. Nd4 f4 55. Ne6 Bg5 56. Nxg5 Kxg5 57. Kf3 Kh4 58. Kxf4 Kxh3 1/2-1/2');

SELECT * FROM chessgame1;
/*
Output
 pgn
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4 11. Ne2 c5 12. Bg5 d5 13. Bxf6 Bxf6 14. Bxd5 Bxd5 15. exd5 Qxd5 16. Ng3 c4 17. Re1 Rae8 18. a4 Rxe1+ 19. Qxe1 cxd3 20. cxd3 bxa4 21. Qd1 Qb5 22. Ne4 Be7 23. Qc2 Rb8 24. Rxa4 Qxb2 25. Qxb2 Rxb2 26. g4 Rb6 27. Rxd4 Kf8 28. Rd7 Rg6 29. Kf1 Rxg4 30. Ra7 f5 31. Ng3 g6 32. Rxa6 Rh4 33. Kg2 Rd4 34. Ne2 Rxd3 35. Ng1 Rd7 36. Nf3 Kg7 37. h3 Bf6 38. Kg3 Rb7 39. Kg2 Re7 40. Ra5 Rc7 41. Rd5 Ra7 42. Rb5 Be7 43. Nd4 Rd7 44. Nf3 Rd6 45. Rb7 Kf6 46. Ra7 h6 47. Nh4 Bd8 48. Rh7 Rd2 49. Rxh6 Kg7 50. Rxg6+ Kh7 51. Nf3 Rxf2+ 52. Kxf2 Kxg6 53. Kg2 Kh5 54. Nd4 f4 55. Ne6 Bg5 56. Nxg5 Kxg5 57. Kf3 Kh4 58. Kxf4 Kxh3
*/




-- Validate type cast operation from string to chess_game data type
SELECT 
'1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4 
11. Ne2 c5 12. Bg5 d5 13. Bxf6 Bxf6 14. Bxd5 Bxd5 15. exd5 Qxd5 16. Ng3 c4 17. Re1 Rae8 18. a4 Rxe1+ 19. Qxe1 cxd3 20. cxd3 bxa4 
21. Qd1 Qb5 22. Ne4 Be7 23. Qc2 Rb8 24. Rxa4 Qxb2 25. Qxb2 Rxb2 26. g4 Rb6 27. Rxd4 Kf8 28. Rd7 Rg6 29. Kf1 Rxg4 
30. Ra7 f5 31. Ng3 g6 32. Rxa6 Rh4 33. Kg2 Rd4 34. Ne2 Rxd3 35. Ng1 Rd7 36. Nf3 Kg7 37. h3 Bf6 38. Kg3 Rb7 39. Kg2 Re7 
40. Ra5 Rc7 41. Rd5 Ra7 42. Rb5 Be7 43. Nd4 Rd7 44. Nf3 Rd6 45. Rb7 Kf6 46. Ra7 h6 47. Nh4 Bd8 48. Rh7 Rd2 49. Rxh6 Kg7 
50. Rxg6+ Kh7 51. Nf3 Rxf2+ 52. Kxf2 Kxg6 53. Kg2 Kh5 54. Nd4 f4 55. Ne6 Bg5 56. Nxg5 Kxg5 57. Kf3 Kh4 58. Kxf4 Kxh3 1/2-1/2'::chess_game as pgn_notaion;
/*
Output
 pgn_notation
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O b5 6. Bb3 Bb7 7. d3 Be7 8. Nc3 O-O 9. a3 Nd4 10. Nxd4 exd4 11. Ne2 c5 12. Bg5 d5 13. Bxf6 Bxf6 14. Bxd5 Bxd5 15. exd5 Qxd5 16. Ng3 c4 17. Re1 Rae8 18. a4 Rxe1+ 19. Qxe1 cxd3 20. cxd3 bxa4 21. Qd1 Qb5 22. Ne4 Be7 23. Qc2 Rb8 24. Rxa4 Qxb2 25. Qxb2 Rxb2 26. g4 Rb6 27. Rxd4 Kf8 28. Rd7 Rg6 29. Kf1 Rxg4 30. Ra7 f5 31. Ng3 g6 32. Rxa6 Rh4 33. Kg2 Rd4 34. Ne2 Rxd3 35. Ng1 Rd7 36. Nf3 Kg7 37. h3 Bf6 38. Kg3 Rb7 39. Kg2 Re7 40. Ra5 Rc7 41. Rd5 Ra7 42. Rb5 Be7 43. Nd4 Rd7 44. Nf3 Rd6 45. Rb7 Kf6 46. Ra7 h6 47. Nh4 Bd8 48. Rh7 Rd2 49. Rxh6 Kg7 50. Rxg6+ Kh7 51. Nf3 Rxf2+ 52. Kxf2 Kxg6 53. Kg2 Kh5 54. Nd4 f4 55. Ne6 Bg5 56. Nxg5 Kxg5 57. Kf3 Kh4 58. Kxf4 Kxh3
(1 row)
*/