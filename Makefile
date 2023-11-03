EXTENSION   = chess_game
MODULES 	= chess_game
DATA        = chess_game--1.0.sql chess_game.control

PG_CONFIG ?= pg_config
PGXS = $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)


clean:
	rm -f *.o *.so *.out