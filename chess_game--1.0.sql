-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION chess_board" to load this file. \quit

/******************************************************************************
 * Input/Output
 ******************************************************************************/



CREATE OR REPLACE FUNCTION chess_board_in(cstring)
  RETURNS int
  AS 'MODULE_PATHNAME'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

CREATE OR REPLACE FUNCTION chess_board_out(chess_board)
  RETURNS cstring
  AS 'MODULE_PATHNAME'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE TYPE chess_board (
  internallength = 64,
  input          = chess_board_in,
  output         = chess_board_out
);