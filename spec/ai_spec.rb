require_relative "../lib/console"

require 'rspec'

describe ComputerAi do

  let(:computer)  {ComputerAi.new({symbol: "x", opponent: "o"})}
  let(:game)      {GamePlay.new}


  it "should take win instead of block" do
    grid = ["x", "x", " ",
            "o", " ", "o",
            " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    computer.assert_values(board).should eq(2)
  end

  it "should take win instead of block as last move" do
    grid = ["x", "x", " ",
            "o", "o", "x",
            " ", "o", "o"]
    board = TicTacToeBoard.new(grid)
    computer.assert_values(board).should eq(2)
  end

  it "takes only spot on board" do
    grid = ["o", "x", "o",
            "x", " ", "x",
            "o", "o", "x"]
    board = TicTacToeBoard.new(grid)
    computer.assert_values(board).should eq(4)
  end

  it "should block player from win" do
    grid = ["o", "x", " ",
            "o", " ", "o",
            "x", " ", " "]
    board = TicTacToeBoard.new(grid)
    computer.assert_values(board).should eq(4)
  end

  it "should take middle position to counter corner move" do
    grid = [" ", " ", "o",
            " ", " ", " ",
            " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    computer.assert_values(board).should eq(4)
  end

  # it "should take midgridosition to counter middle perimeter move" do
  #   board = [" ", " ", " ",
#            " ", " ", "o",
 #            " ", " "board = TicTacToeBoard.new(grid)
  #   computer.assert_values(board).should eq(4) # 2,3,4,8
  # end

  it "should take win when available" do
    grid = ["o", " ", "x",
            " ", " ", "o",
            "x", " ", " "]
    board = TicTacToeBoard.new(grid)
    computer.assert_values(board).should eq(4)
  end

  xit "should start game at known optimal positions" do     # PENDING
    grid = [" ", " ", " ",
            " ", " ", " ",
            " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    computer.assert_values(board).should eq(0)
  end

  it "should return true if game is over with full board" do
    grid = ["o", "x", "o",
            "x", "o", "x",
            "x", "o", "x"]
    board = TicTacToeBoard.new(grid)
    computer.gameover?(board).should eq(true)
  end

  it "should return true if game is over with diagonal win" do
    grid = ["o", "x", "o",
            "x", "o", "x",
            " ", " ", "o"]
    board = TicTacToeBoard.new(grid)
    computer.gameover?(board).should eq(true)
  end

  it "should return false if game is not over" do
    grid = ["x", "x", "o",
            "x", "o", "x",
            " ", " ", "o"]
    board = TicTacToeBoard.new(grid)
    computer.gameover?(board).should eq(false)
  end

  it "should return a 0 value based on tie game" do
    grid = ["o", "x", "o",
            "x", "o", "x",
            "x", "o", "x"]
    board = TicTacToeBoard.new(grid)
    computer.create_value(board).should eq(0)
  end

  it "should create a negitve value based on board lose" do
    grid = ["o", "o", "o",
            "x", " ", "x",
            " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    computer.create_value(board).should eq(-1)
  end

  it "should create a positive value based on board win" do
    grid = ["x", " ", " ",
            "o", "x", "o",
            " ", " ", "x"]
    board = TicTacToeBoard.new(grid)
    computer.create_value(board).should eq(1)
  end

  it "returns correct value of last position winning move" do
    grid = ["o", "x", "o",
            "x", "x", "x",
            "o", "o", "x"]
    board = TicTacToeBoard.new(grid)
    computer.create_value(board).should eq(1)
  end

  it "returns zero value when board is incomplete" do
    grid = ["o", "x", "o",
            " ", "x", "x",
            "o", "o", "x"]
    board = TicTacToeBoard.new(grid)
    computer.create_value(board).should eq(0)
  end
end
