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
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'hasOpening'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE FUNCTION hasBoard(chess_game, chess_board,integer)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'hasBoard'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE FUNCTION hasOpening_lt(chess_game, chess_game)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'hasOpening_lt'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE FUNCTION hasOpening_le(chess_game, chess_game)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'hasOpening_le'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

CREATE FUNCTION hasOpening_eq(chess_game, chess_game)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'hasOpening_eq'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE FUNCTION hasOpening_gt(chess_game, chess_game)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'hasOpening_gt'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;



CREATE FUNCTION hasOpening_ge(chess_game, chess_game)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'hasOpening_ge'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE OPERATOR = (
  LEFTARG  = chess_game,
  RIGHTARG = chess_game,
  PROCEDURE = hasOpening_eq,
  COMMUTATOR = =
);

CREATE OPERATOR < (
  LEFTARG  = chess_game,
  RIGHTARG = chess_game,
  PROCEDURE = hasOpening_lt,
  COMMUTATOR = >
);

CREATE OPERATOR <= (
  LEFTARG  = chess_game,
  RIGHTARG = chess_game,
  PROCEDURE = hasOpening_le,
  COMMUTATOR = >=
);

CREATE OPERATOR > (
  LEFTARG  = chess_game,
  RIGHTARG = chess_game,
  PROCEDURE = hasOpening_gt,
  COMMUTATOR = <
);

CREATE OPERATOR >= (
  LEFTARG  = chess_game,
  RIGHTARG = chess_game,
  PROCEDURE = hasOpening_ge,
  COMMUTATOR = <=
);

CREATE OR REPLACE FUNCTION chess_game_cmp(chess_game, chess_game)
  RETURNS integer
  AS 'MODULE_PATHNAME', 'chess_game_cmp'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE OPERATOR CLASS chess_game_ops
DEFAULT FOR TYPE chess_game USING btree
AS
        OPERATOR        1       <  ,
        OPERATOR        2       <= ,
        OPERATOR        3       =  ,
        OPERATOR        4       >= ,
        OPERATOR        5       >  ,
        FUNCTION        1       chess_game_cmp(chess_game, chess_game);
