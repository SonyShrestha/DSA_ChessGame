-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION chess_game" to load this file. \quit

/******************************************************************************
 * Input/Output
 ******************************************************************************/

CREATE OR REPLACE FUNCTION chess_board_in(cstring)
  RETURNS chess_board
  AS 'MODULE_PATHNAME'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

CREATE OR REPLACE FUNCTION chess_board_out(chess_board)
  RETURNS cstring
  AS 'MODULE_PATHNAME'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

CREATE TYPE chess_board (
  internallength = 69, -- 69 is the length of the `board` type from `smallchesslib.h`
  input          = chess_board_in,
  output         = chess_board_out
  -- alignment      = double  -- TODO: `alignment` is used in `complex` extension, is it useful?
);


CREATE OR REPLACE FUNCTION chess_game_in(cstring)
  RETURNS chess_game
  AS 'MODULE_PATHNAME'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

CREATE OR REPLACE FUNCTION chess_game_out(chess_game)
  RETURNS cstring
  AS 'MODULE_PATHNAME'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

CREATE TYPE chess_game (
  internallength = 512, -- 69 is the length of the `board` type from `smallchesslib.h`
  input          = chess_game_in,
  output         = chess_game_out
  -- alignment      = double  -- TODO: `alignment` is used in `complex` extension, is it useful?
);

CREATE FUNCTION getBoard(chess_game, integer)
  RETURNS chess_board
  AS 'MODULE_PATHNAME', 'getBoard'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

  CREATE FUNCTION getFirstMoves(chess_game, integer)
  RETURNS chess_game
  AS 'MODULE_PATHNAME', 'getFirstMoves'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

    CREATE FUNCTION hasOpening(chess_game,chess_game)
  RETURNS integer
  AS 'MODULE_PATHNAME', 'hasOpening'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;