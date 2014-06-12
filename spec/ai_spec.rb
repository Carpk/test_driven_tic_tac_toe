require_relative "../lib/console"

require 'rspec'

describe ComputerAi do

  let(:computer)  {ComputerAi.new("x", "o")}
  let(:board)     {TicTacToeBoard.new}

  it "should determine the next position to move to" do
    board.grid = ["x", "x", nil, nil, nil, "o", nil, nil, "o"]
    computer.evaluate_board(board, "x", "o").should eq(2)
  end

  it "should create a value based on board win" do
    board.grid = ["x", "x", "x", "o", nil, "o", nil, nil, nil]
    computer.create_value(board).should eq(10)
  end

  it "should create a value based on board win" do
    board.grid = ["o", "o", "o", "x", nil, "x", nil, nil, nil]
    computer.create_value(board).should eq(-10)
  end

  # it "should determine if board is complete" do
  #   board.grid = ["x", "x", nil, "o", nil, "o", nil, nil, nil]
  #   computer.board_complete?(board).should eq(false)
  # end
end
