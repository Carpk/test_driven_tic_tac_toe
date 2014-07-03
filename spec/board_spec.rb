require_relative "../lib/console"

require 'rspec'

describe TicTacToeBoard do

  let(:board)  {TicTacToeBoard.new}

  it "should return the correct length of board" do
    board.grid.length.should eq(9)
  end

  it "should return true for having multiple unassigned positions on board" do
    board.unassigned_positions?.should eq(true)
  end

  it "should return false for not having unassigned positions on board" do
    board.grid = ["o", "x", "o",
                  "x", "o", "x",
                  "x", "o", "x"]
    board.unassigned_positions?.should eq(false)
  end

  it "should return true for having a unassigned position on board" do
    board.grid = ["o", "x", "o",
                  "x", nil, "x",
                  "x", "o", "x"]
    board.unassigned_positions?.should eq(true)
  end

  it "should return false for empty board" do
    board.board_full?.should eq(false)
  end

  it "should return false for empty position on board" do
    board.grid = ["o", "x", "o",
                  "x", nil, "x",
                  "x", "o", "x"]
    board.board_full?.should eq(false)
  end

  it "should return false for empty board" do
    board.grid = ["o", "x", "o",
                  "x", "o", "x",
                  "x", "o", "x"]
    board.board_full?.should eq(true)
  end

  it "should assign player to board position" do
    token, position = "r", 7
    board.assign_token_to(token, position)
    board.grid[7].should eq("r")
  end

  it "should assign player to board position" do
    token, position = "x", 3
    board.assign_token_to(token, position)
    board.grid[3].should eq("x")
  end

  it "should return the square root for board of 9" do
    board.square_root_of_board.should eq(3)
  end

  it "should return the square root for board of 12" do
    board.grid = ["o", "x", "o", nil,
                  "x", "o", "x", nil,
                  "x", "o", "x", nil,
                  nil, nil, nil, nil]
    board.square_root_of_board.should eq(4)
  end

  it "should return fasle if row set has not won" do
    board.matching_rows?.should eq(false)
  end

  it "should know if row has won with top set" do
    board.grid = ['f','f','f',
                  nil,nil,nil,
                  nil,nil,nil]
    board.matching_rows?.should eq(true)
  end

  it "should know if row has won with middle set" do
    board.grid = [nil,nil,nil,
                  "e","e","e",
                  nil,nil,nil]
    board.matching_rows?.should eq(true)
  end

  it "should know if row has won with bottom set" do
    board.grid = [nil,nil,nil,
                  nil,nil,nil,
                  "g","g","g"]
    board.matching_rows?.should eq(true)
  end

  it "should return false column if set has not won" do
    board.matching_columns?.should eq(false)
  end

  it "should know if column has won with first set" do
    board.grid = ["r",nil,nil,
                  "r",nil,nil,
                  "r",nil,nil]
    board.matching_columns?.should eq(true)
  end

  it "should know if column has won with middle set" do
    board.grid = [nil,"p",nil,
                  nil,"p",nil,
                  nil,"p",nil]
    board.matching_columns?.should eq(true)
  end

  it "should know if column has won with last set" do
    board.grid = [nil,nil,"t",
                  nil,nil,"t",
                  nil,nil,"t"]
    board.matching_columns?.should eq(true)
  end

  it "should return false if forwardslash diagonal set has not won" do
    board.matching_forwardslash?.should eq(false)
  end

  it "should know if forwardslash diagonal set has won" do
    board.grid = [nil,nil,"o",
                  nil,"o",nil,
                  "o",nil,nil]
    board.matching_forwardslash?.should eq(true)
  end

  it "should return false if diagonal has not won" do
    board.matching_backslash?.should eq(false)
  end

  it "should know if diagonal has won" do
    board.grid = ["x",nil,nil,
                  nil,"x",nil,
                  nil,nil,"x"]
    board.matching_backslash?.should eq(true)
  end

  it "should know if game is over" do
    board.grid = ["o","o","o",nil,nil,nil,nil,nil,nil]
    board.matching_rows?
    board.winner_value.should eq("o")
  end

  it "should check if given group is matching" do
    group = ["o","o","o"]
    board.group_check(group).should eq(true)
  end

  it "should return false if given group is not matching" do
    group = ["x","o","o"]
    board.group_check(group).should eq(nil)
  end

  it "should return false if given group is not matching" do
    group = ["o","x","o"]
    board.group_check(group).should eq(nil)
  end

  it "should return false if given group is not matching" do
    group = ["o","o","x"]
    board.group_check(group).should eq(nil)
  end

  it "should return false if given group is not matching" do
    group = ["o","o",nil]
    board.group_check(group).should eq(nil)
  end

  it "should return false if given group is not matching" do
    group = ["o",nil,"o"]
    board.group_check(group).should eq(nil)
  end

  it "should return false if given group is not matching" do
    group = [nil, nil, nil]
    board.group_check(group).should eq(nil)
  end
end
