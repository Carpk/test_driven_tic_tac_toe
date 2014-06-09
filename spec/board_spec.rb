require_relative "../lib/console"

require 'rspec'

describe TicTacToeBoard do

  let(:board)  {TicTacToeBoard.new}

  it "should return the correct length of board" do
    board.grid.length.should eq(9)
  end

  it "should know if there are unassigned positions" do
    board.unassigned_positions?.should eq(true)
  end

  it "should return correct version of board" do
    board.present_board.length.should eq(9)
  end

  it "should return correct version of board" do
    board.present_board.length.should eq(9)
  end

  it "should assign player to board position" do
    token, position = "r", 7
    board.assign_token_to(token, position)
    board.grid[7].should eq("r")
  end
end