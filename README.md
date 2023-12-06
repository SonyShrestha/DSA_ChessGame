# DSA_ChessGame
Repository for the project of the course DATABASE SYSTEM ARCHITECTURE (INFO-H417) from the program BDMA Fall 2023.

This repository can be accessed [here](https://github.com/SonyShrestha/DSA_ChessGame).

This project involves developing extension in Postgres, with following implementation 
1. Data Type:  
    - Chess Board(chess_board)
    - Chess Game(chess_game)
2. Functions
    - getBoard(chessgame, integer) -> chessboard 
    - getFirstMoves(chessgame, integer) -> chessgame
    - hasOpening(chessgame, chessgame) -> boolean
    - hasBoard(chessgame, chessboard, integer) -> boolean
3. Index 
    - B-Tree on chess_game data type
    - GIN on chess_game data type

<br /><br />
Group members
1. [Sony Shrestha](https://github.com/SonyShrestha)
2. [Aayush Paudel](https://github.com/Aayush360) 
3. [Hadi El Yakhni](https://github.com/hadielyakhni)
4. [Iyoha Peace Osamuyi](https://github.com/Pce-iyos)

<br />
Professors

1. Sakr Mahmoud<br />
2. Schoemans Maxime<br />
<br />
<br />

# Instructions

To create extension follow following steps: 

``$ sudo make install``
``$ psql [user]``
``DROP EXTENSION IF EXISTS chess_game CASCADE;``
``CREATE EXTENSION chess_game;``

We have written some test scripts that one could be interested in performing with this extension, you can execute them by running:

``$ psql [user] -a -f sql_files/test_script.sql``

<br /><br />
# Code
The code is organized in following way for PostgreSQL extensions:

- SQL Files inside sql_files folder is for the purpose of testing implementation of extension. Each implementation can be tested seperately or all of them can be tested at once using file test_script.sql.
- chess_game--1.0.sql is the SQL script where the extension is defined, interfacing between PostgreSQL and C.
- chess_game.c is the C file where the functions defined for the extension are implemented.
- DBSA.pptx is the file that was prepared for the purpose of presentation.
- generateSamplePGN.py is the python script to generate sample chessgame in PGN notation. Number of games required can be modified by changing value of num_games in python script.
- Makefile is the make orchestrator to easily link all dependencies and compile as required.
- smallchesslib.h is the header file containing macros and function declaration needed for building chess_game extension.