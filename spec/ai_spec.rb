require_relative "../lib/console"

require 'rspec'

describe ComputerAi do

  let(:computer)  {ComputerAi.new("x", "o")}
  let(:game)      {GamePlay.new}

  it "should create a value based on tie game" do
    new_board = ["o", "x", "o",
                 "x", "o", "x",
                 "x", "o", "x"]
    game.set_board_values(new_board)
    game.gameover?
    computer.create_value(game).should eq(0)
  end

  it "should create a value based on board lose" do
    new_board = ["o", "o", "o",
                 "x", nil, "x",
                 nil, nil, nil]
    game.set_board_values(new_board)
    game.gameover?
    computer.create_value(game).should eq(-1)
  end

  it "should create a value based on board win" do
    new_board = ["x", nil, nil,
                 "o", "x", "o",
                 nil, nil, "x"]
    game.set_board_values(new_board)
    game.gameover?
    computer.create_value(game).should eq(1)
  end

  it "should determine the next position to move to" do
    new_board = ["x", "x", nil,
                 "o", nil, "o",
                 nil, "o", nil]
    game.set_board_values(new_board)
    computer.evaluate_board(game)#.should eq(2)
    computer.new_position.should eq(2)
  end

  # it "should determine the next position to move to" do
  #   new_board = ["o", nil, nil,
  #                "o", nil, "o",
  #                "x", "x", nil]
  #   game.set_board_values(new_board)
  #   computer.evaluate_board(game)#.should eq(8)
  #   computer.new_position.should eq(8)
  # end

  # it "should create a value based on board win" do
  #   game.set_board_values(["x", "x", "x", "o", nil, "o", nil, nil, nil])
  #   computer.create_value(board).should eq(10)
  # end

  # it "should determine if board is complete" do
  #   board.grid = ["x", "x", nil, "o", nil, "o", nil, nil, nil]
  #   computer.board_complete?(board).should eq(false)
  # end
end
