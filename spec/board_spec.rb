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

  it "should return the square root of board" do
    board.square_root_of_board.should eq(3)
  end

  it "should know if row set has won" do
    board.matching_rows.should eq(false)
  end

  it "should know if column set has won" do
    board.matching_columns.should eq(false)
  end

  it "should know if diagonal set has won" do
    board.matching_forwardslash.should eq(false)
  end

  it "should know if diagonal has won" do
    board.matching_backslash.should eq(false)
  end
end