# Python script to geenrate sample PGN Notations
import chess
import chess.pgn
import csv
import random

def generate_random_game():
    board = chess.Board()
    game = chess.pgn.Game()
    game.headers["Event"] = "Random Chess Game"
    game.headers["Site"] = "Chessboard"
    game.headers["Date"] = "2023.12.01"
    game.headers["Round"] = str(random.randint(1, 10))
    game.headers["White"] = "Player1"
    game.headers["Black"] = "Player2"
    game.headers["Result"] = random.choice(["1-0", "0-1", "1/2-1/2"])

    while not board.is_game_over():
        legal_moves = [move for move in board.legal_moves]
        random_move = random.choice(legal_moves)
        board.push(random_move)

    game.add_line(board.move_stack)
    return game

def save_games_to_csv(games, filename):
    with open(filename, "w", newline="") as csvfile:
        fieldnames = ["Event", "Site", "Date", "Round", "White", "Black", "Result", "Moves"]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()

        for game in games:
            row = {
                "Event": game.headers.get("Event", ""),
                "Site": game.headers.get("Site", ""),
                "Date": game.headers.get("Date", ""),
                "Round": game.headers.get("Round", ""),
                "White": game.headers.get("White", ""),
                "Black": game.headers.get("Black", ""),
                "Result": game.headers.get("Result", ""),
                "Moves": game.mainline_moves(),
            }
            writer.writerow(row)

if __name__ == "__main__":
    num_games = 100000
    generated_games = [generate_random_game() for _ in range(num_games)]
    save_games_to_csv(generated_games, "sample_pgn.csv")
