require_relative "../lib/console"

require 'rspec'

describe GamePlay do

  let(:game)      {GamePlay.new(TicTacToeBoard.new(Array.new(9," ")))}

  it "should create new players from hash" do
    hash = {player1: {symbol: "x", ai: "n"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash).class.should eq(Hash)
  end

  it "should know game is not over at start of game" do
    hash = {player1: {symbol: "x", ai: "n"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash)
    game.gameover?.should eq(false)
  end

  # it "should know if game is over with player win" do
  #   board = [" ", "o", " ",
  #            " ", "o", " ",
  #            " ", "o", " "]
  #   game.set_board_values(board)
  #   game.gameover?.should eq(true)
  # end

  # it "should know if game is over with a full board" do
  #   board = ["x", "o", "x",
  #            "o", "x", "o",
  #            "o", "x", "o"]
  #   game.set_board_values(board)
  #   game.gameover?.should eq(true)
  # end

  # it "should know if game is not over with 1 empty cell" do
  #   board = [" ", "o", "x",
  #            "o", "x", "o",
  #            "o", "x", "o"]
  #   game.set_board_values(board)
  #   game.gameover?.should eq(false)
  # end

  # it "should know if game has a no winner" do
  #   board = [" ", " ", "x",
  #            " ", "o", " ",
  #            " ", " ", "o"]
  #   game.set_board_values(board)
  #   game.game_winner?.should eq(false)
  # end

  # it "should know when game has a forwardslash winner" do
  #   board = ["o", " ", "x",
  #            " ", "o", " ",
  #            " ", " ", "o"]
  #   game.set_board_values(board)
  #   game.game_winner?.should eq(true)
  # end

  it "display board should be of the correct length" do
    game.display_board.length.should eq(9)
  end

  it "game token should occupy position" do
    hash = {player1: {symbol: "x", ai: "n"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash)
    game.player_move_to(3)
    game.display_board[3].should eq("x")
  end

  it "should create a players hash" do
    hash = {player1: {symbol: "x", ai: "n"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash).class.should eq(Hash)
  end

  # it "should correctly set player position" do
  #   board = [" ", " ", " ",
  #            " ", "o", " ",
  #            " ", " ", " "]
  #   game.set_board_values(board)
  #   game.display_board[4].should eq("o")
  # end

  it "should move player to correct position" do
    hash = {player1: {symbol: "x", ai: "n"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash)
    game.player_move_to(5)
    game.display_board[5].should eq("x")
  end

  # it "should get a response from the ai" do
  #   hash = {player1: {symbol: "x", ai: "y"}, player2: {symbol: "o", ai: "n"}}
  #   game.create_players(hash)
  #   game.computer_turn.class.should eq(Fixnum)
  # end

end
