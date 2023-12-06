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
  internallength = 512, -- 512 is the length of the `record` type from `smallchesslib.h`
  input          = chess_game_in,
  output         = chess_game_out
);


CREATE FUNCTION getBoard(chess_game, integer)
  RETURNS chess_board
  AS 'MODULE_PATHNAME', 'getBoard'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE FUNCTION getFirstMoves(chess_game, integer)
  RETURNS chess_game
  AS 'MODULE_PATHNAME', 'getFirstMoves'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE OR REPLACE FUNCTION hasOpening(game chess_game, opening chess_game) 
    RETURNS boolean
    AS $$
        select game >= opening AND game < opening;
    $$
    LANGUAGE sql;    


CREATE OR REPLACE FUNCTION hasBoard(game chess_game, board chess_board,half_move integer) 
    RETURNS boolean
    AS $$
        select game @> CONCAT(half_move::VARCHAR,',',board::VARCHAR);
    $$
    LANGUAGE sql;  


CREATE FUNCTION chess_game_lt(chess_game, chess_game)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'chess_game_lt'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE FUNCTION chess_game_le(chess_game, chess_game)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'chess_game_le'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE FUNCTION chess_game_eq(chess_game, chess_game)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'chess_game_eq'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE FUNCTION chess_game_gt(chess_game, chess_game)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'chess_game_gt'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE FUNCTION chess_game_ge(chess_game, chess_game)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'chess_game_ge'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE FUNCTION chess_contains_within_func(chess_game, text)
  RETURNS boolean
  AS 'MODULE_PATHNAME', 'chess_contains_within_func'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;


CREATE OPERATOR = (
  LEFTARG  = chess_game,
  RIGHTARG = chess_game,
  PROCEDURE = chess_game_eq,
  COMMUTATOR = =
);


CREATE OPERATOR < (
  LEFTARG  = chess_game,
  RIGHTARG = chess_game,
  PROCEDURE = chess_game_lt
);


CREATE OPERATOR <= (
  LEFTARG  = chess_game,
  RIGHTARG = chess_game,
  PROCEDURE = chess_game_le,
  COMMUTATOR = >=
);


CREATE OPERATOR > (
  LEFTARG  = chess_game,
  RIGHTARG = chess_game,
  PROCEDURE = chess_game_gt
);


CREATE OPERATOR >= (
  LEFTARG  = chess_game,
  RIGHTARG = chess_game,
  PROCEDURE = chess_game_ge,
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


CREATE FUNCTION chess_game_extractValue(chess_game,internal)
RETURNS internal AS 'MODULE_PATHNAME', 'chess_game_extractValue'
LANGUAGE C STRICT;


CREATE FUNCTION chess_game_extractQuery(text,internal,internal,internal,internal,internal,internal)
RETURNS internal AS 'MODULE_PATHNAME', 'chess_game_extractQuery'
LANGUAGE C STRICT;


CREATE FUNCTION chess_game_consistent(internal,internal,internal,internal,internal,internal)
RETURNS internal AS 'MODULE_PATHNAME', 'chess_game_consistent'
LANGUAGE C STRICT;


CREATE FUNCTION chess_board_compare(chess_board,chess_board)
RETURNS int AS 'MODULE_PATHNAME', 'chess_board_compare'
LANGUAGE C STRICT;


CREATE OPERATOR @> (
  PROCEDURE = chess_contains_within_func, 
  LEFTARG = chess_game, 
  RIGHTARG = text
);


CREATE OPERATOR CLASS chessgame_ops
DEFAULT FOR TYPE chess_game USING gin AS
    OPERATOR        1       @>(chess_game,text),
    FUNCTION		    1		    chess_board_compare(chess_board, chess_board),
    FUNCTION        2       chess_game_extractValue(chess_game,internal),
    FUNCTION        3       chess_game_extractQuery(text,internal,internal,internal,internal,internal,internal),
    FUNCTION        4       chess_game_consistent(internal,internal,internal,internal,internal,internal),
    STORAGE chess_board;