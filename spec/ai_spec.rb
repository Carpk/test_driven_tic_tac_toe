require_relative "../lib/console"

require 'rspec'

describe ComputerAi do

  let(:computer)  {ComputerAi.new}
  let(:board)  {TicTacToeBoard.new}

  it "should determine the next position to move to" do
    board.grid = ["x", nil, nil, nil, nil, "o", nil, nil, nil]
    computer.evaluate_board(board, "x", "o").should eq(2)
  end

  # it "should create a value based on board win" do
  #   board = ["x", "x", nil, "o", nil, "o", nil, nil, nil]
  #   computer.create_value.should eq(2)
  # end

  it "should determine if board is complete" do
    board.grid = ["x", "x", nil, "o", nil, "o", nil, nil, nil]
    computer.board_complete?(board).should eq(false)
  end
end
