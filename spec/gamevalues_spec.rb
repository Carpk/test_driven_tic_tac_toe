require_relative "../lib/console"

require 'rspec'

describe GameValues do

  it "should know when a game is over from a full board" do
    board = ["x", "o", "x",
             "o", "x", "o",
             "o", "x", "o"]
             # TicTacToeBoard.new(board)
    GameValues.gameover?(board).should eq(true)
  end

  it "should know when a game is over from a winning board" do
    board = ["x", "o", " ",
             "o", "x", "o",
             "o", "x", "x"]
    GameValues.gameover?(board).should eq(true)
  end

  it "should know when a game is not over" do
    board = ["x", "o", " ",
             "o", "x", "o",
             "o", "x", " "]
    GameValues.gameover?(board).should eq(false)
  end

  it "should return false if there is no winner" do
    board = ["x", "o", " ",
             "o", "x", "o",
             "o", "x", " "]
    GameValues.board_has_winner?(board).should eq(false)
  end

  it "should return true if there is a matching array" do
    board = ["x", "o", " ",
             "o", "x", "o",
             "x", "x", "x"]
    GameValues.board_has_winner?(board).should eq(true)
  end

  it "should return false if only matches are empty cells" do
    board = ["x", "o", " ",
             "o", "x", " ",
             "x", "x", " "]
    GameValues.board_has_winner?(board).should eq(false)
  end

  it "should return winner of a winning board" do
    board = ["x", "o", " ",
             "o", "x", "o",
             "x", "x", "x"]
    GameValues.winner_of(board).should eq("x")
  end

  it "should return true if board is tied" do
    board = ["x", "o", "x",
             "x", "o", "x",
             "o", "x", "o"]
    GameValues.tie_game?(board).should eq(true)
  end

  it "should return false if board is not full" do
    board = ["x", "o", " ",
             "x", "o", "x",
             "o", "x", "o"]
    GameValues.tie_game?(board).should eq(false)
  end

  it "should return false if board has a winner" do
    board = ["o", "o", " ",
             "x", "o", "x",
             "o", "x", "o"]
    GameValues.tie_game?(board).should eq(false)
  end

end
