require_relative "../lib/console"

require 'rspec'

describe GameValues do

  it "should know when a game is over from a full board" do
    grid = ["x", "o", "x",
            "o", "x", "o",
            "o", "x", "o"]
    board = TicTacToeBoard.new(grid)
    GameValues.gameover?(board).should eq(true)
  end

  it "should know when a game is over from a winning board" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "o", "x", "x"]
    board = TicTacToeBoard.new(grid)
    GameValues.gameover?(board).should eq(true)
  end

  it "should know when a game is not over" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "o", "x", " "]
    board = TicTacToeBoard.new(grid)
    GameValues.gameover?(board).should eq(false)
  end

  it "should return false if there is no winner" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "o", "x", " "]
    board = TicTacToeBoard.new(grid)
    GameValues.board_has_winner?(board).should eq(false)
  end

  it "should return true if there is a matching array" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "x", "x", "x"]
    board = TicTacToeBoard.new(grid)
    GameValues.board_has_winner?(board).should eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", " ",
            "o", "x", " ",
            "x", "x", " "]
    board = TicTacToeBoard.new(grid)
    GameValues.board_has_winner?(board).should eq(false)
  end

  it "should return winner of a winning board" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "x", "x", "x"]
    board = TicTacToeBoard.new(grid)
    GameValues.winner_of(board).should eq("x")
  end

  it "should return true if board is tied" do
    grid = ["x", "o", "x",
            "x", "o", "x",
            "o", "x", "o"]
    board = TicTacToeBoard.new(grid)
    GameValues.tie_game?(board).should eq(true)
  end

  it "should return false if board is not full" do
    grid = ["x", "o", " ",
            "x", "o", "x",
            "o", "x", "o"]
    board = TicTacToeBoard.new(grid)
    GameValues.tie_game?(board).should eq(false)
  end

  it "should return false if board has a winner" do
    grid = ["o", "o", " ",
            "x", "o", "x",
            "o", "x", "o"]
    board = TicTacToeBoard.new(grid)
    GameValues.tie_game?(board).should eq(false)
  end

  it "should be false if first cell is empty" do
    section = [" ", "g", "g"]
    GameValues.group_match?(section).should eq(false)
  end

  it "should be false if second cell is empty" do
    section = ["g", " ", "g"]
    GameValues.group_match?(section).should eq(false)
  end

  it "should be false if last cell is empty" do
    section = ["g", "g", " "]
    GameValues.group_match?(section).should eq(false)
  end

  it "should be false if argument contains only 2 the same character" do
    section = ["g", "x", "g"]
    GameValues.group_match?(section).should eq(false)
  end

  it "should be false if argument contains only 2 the same character" do
    section = ["g", "g", "x"]
    GameValues.group_match?(section).should eq(false)
  end

  it "should be false if section is completely empty" do
    section = [" ", " ", " "]
    GameValues.group_match?(section).should eq(false)
  end

  it "should be true if argument contains the same character" do
    section = ["g", "g", "g"]
    GameValues.group_match?(section).should eq(true)
  end
end
