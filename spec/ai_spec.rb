require_relative "../lib/console"

require 'rspec'

describe ComputerAi do

  let(:computer)  {ComputerAi.new({symbol: "x", opponent: "o"})}
  let(:game)      {GamePlay.new}


  it "should take win instead of block" do
    board = ["x", "x", " ",
             "o", " ", "o",
             " ", " ", " "]
    computer.assert_values(board).should eq(2)
  end

  it "should take win instead of block as last move" do
    board = ["x", "x", " ",
             "o", "o", "x",
             " ", "o", "o"]
    computer.assert_values(board).should eq(2)
  end

  it "takes only spot on board" do
    board = ["o", "x", "o",
             "x", " ", "x",
             "o", "o", "x"]
    computer.assert_values(board).should eq(4)
  end

  it "should block player from win" do
    board = ["o", "x", " ",
             "o", " ", "o",
             "x", " ", " "]
    computer.assert_values(board).should eq(4)
  end

  it "should take middle position to counter corner move" do
    board = [" ", " ", "o",
             " ", " ", " ",
             " ", " ", " "]
    computer.assert_values(board).should eq(4)
  end

  # it "should take middle position to counter middle perimeter move" do
  #   board = [" ", " ", " ",
  #            " ", " ", "o",
  #            " ", " ", " "]
  #   computer.assert_values(board).should eq(4)
  # end

  it "should take win when available" do
    board = ["o", " ", "x",
             " ", " ", "o",
             "x", " ", " "]
    computer.assert_values(board).should eq(4)
  end

  xit "should start game at known optimal positions" do     # PENDING
    board = [" ", " ", " ",
             " ", " ", " ",
             " ", " ", " "]
    computer.assert_values(board).should eq(0)
  end

  it "should return true if game is over with full board" do
    board = ["o", "x", "o",
             "x", "o", "x",
             "x", "o", "x"]
    computer.gameover?(board).should eq(true)
  end

  it "should return true if game is over with diagonal win" do
    board = ["o", "x", "o",
             "x", "o", "x",
             " ", " ", "o"]
    computer.gameover?(board).should eq(true)
  end

  it "should return false if game is not over" do
    board = ["x", "x", "o",
             "x", "o", "x",
             " ", " ", "o"]
    computer.gameover?(board).should eq(false)
  end

  it "should return a 0 value based on tie game" do
    board = ["o", "x", "o",
             "x", "o", "x",
             "x", "o", "x"]
    computer.create_value(board).should eq(0)
  end

  it "should create a negitve value based on board lose" do
    board = ["o", "o", "o",
             "x", " ", "x",
             " ", " ", " "]
    computer.create_value(board).should eq(-1)
  end

  it "should create a positive value based on board win" do
    board = ["x", " ", " ",
             "o", "x", "o",
             " ", " ", "x"]
    computer.create_value(board).should eq(1)
  end

  it "returns correct value of last position winning move" do
    board = ["o", "x", "o",
             "x", "x", "x",
             "o", "o", "x"]
    computer.create_value(board).should eq(1)
  end

  it "returns zero value when board is incomplete" do
    board = ["o", "x", "o",
             " ", "x", "x",
             "o", "o", "x"]
    computer.create_value(board).should eq(0)
  end
end
