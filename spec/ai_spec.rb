require_relative "../lib/console"

require 'rspec'

describe ComputerAi do

  let(:computer)  {ComputerAi.new("x", "o")}
  let(:game)      {GamePlay.new}


  # it "should determine the next position to move to" do
  #   new_board = ["x", "x", nil,
  #                "o", nil, "o",
  #                nil, "o", nil]
  #   game.set_board_values(new_board)
  #   computer.evaluate_board(game)#.should eq(2)
  #   computer.new_position.should eq(2)
  # end

  it "takes only spot on board" do
    board = ["o", "x", "o",
             "x", nil, "x",
             "o", "o", "x"]
    computer.assert_values(board).should eq(4)
  end

  it "should block player from win" do
    board = ["o", "x", nil,
             "o", nil, "o",
             "x", nil, nil]
    computer.assert_values(board).should eq(4)
  end

  xit "should take optimal position" do
    board = [nil, nil, "o",
             nil, nil, nil,
             nil, nil, nil]
    computer.assert_values(board).should eq(4)
  end

  it "should take win when available" do
    board = ["o", nil, "x",
             nil, nil, "o",
             "x", nil, nil]
    computer.assert_values(board).should eq(4)
  end

  it "should start game at known optimal positions" do
    board = [nil, nil, nil,
             nil, nil, nil,
             nil, nil, nil]
    computer.assert_values(board).should eq(0)
  end

  # it "does something else"

  # it "does another thing"

  # it "should create a value based on board win" do
  #   game.set_board_values(["x", "x", "x", "o", nil, "o", nil, nil, nil])
  #   computer.create_value(board).should eq(10)
  # end

  # it "should determine if board is complete" do
  #   board.grid = ["x", "x", nil, "o", nil, "o", nil, nil, nil]
  #   computer.board_complete?(board).should eq(false)
  # end

  it "should return true if game is over with full board" do
    board = ["o", "x", "o",
             "x", "o", "x",
             "x", "o", "x"]
    computer.gameover?(board).should eq(true)
  end

  it "should return true if game is over with column win" do
    board = ["o", "x", "o",
             "x", "o", "x",
             nil, nil, "o"]
    computer.gameover?(board).should eq(true)
  end

  it "should return false if game is not over" do
    board = ["x", "x", "o",
             "x", "o", "x",
             nil, nil, "o"]
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
             "x", nil, "x",
             nil, nil, nil]
    computer.create_value(board).should eq(-1)
  end

  it "should create a positive value based on board win" do
    board = ["x", nil, nil,
             "o", "x", "o",
             nil, nil, "x"]
    computer.create_value(board).should eq(1)
  end

  it "returns correct value of last position winning move" do
    board = ["o", "x", "o",
             "x", "x", "x",
             "o", "o", "x"]
    computer.create_value(board).should eq(1)
  end
end
