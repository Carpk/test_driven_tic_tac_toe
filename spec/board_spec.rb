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
                  "x", " ", "x",
                  "x", "o", "x"]
    board.unassigned_positions?.should eq(true)
  end

  it "should return false for empty board" do
    board.board_full?.should eq(false)
  end

  it "should return false for empty position on board" do
    board.grid = ["o", "x", "o",
                  "x", " ", "x",
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
    board.board_side_length.should eq(3)
  end

  it "should return the square root for board of 12" do
    board.grid = ["o", "x", "o", " ",
                  "x", "o", "x", " ",
                  "x", "o", "x", " ",
                  " ", " ", " ", " "]
    board.board_side_length.should eq(4)
  end

  it "should return fasle if row set has not won" do
    board.matching_rows?.should eq(false)
  end

  it "should know if row has won with top set" do
    board.grid = ['f','f','f',
                  " "," "," ",
                  " "," "," "]
    board.matching_rows?.should eq(true)
  end

  it "should know if row has won with middle set" do
    board.grid = [" "," "," ",
                  "e","e","e",
                  " "," "," "]
    board.matching_rows?.should eq(true)
  end

  it "should know if row has won with bottom set" do
    board.grid = [" "," "," ",
                  " "," "," ",
                  "g","g","g"]
    board.matching_rows?.should eq(true)
  end

  it "should return false column if set has not won" do
    board.matching_columns?.should eq(false)
  end

  it "should know if column has won with first set" do
    board.grid = ["r"," "," ",
                  "r"," "," ",
                  "r"," "," "]
    board.matching_columns?.should eq(true)
  end

  it "should know if column has won with middle set" do
    board.grid = [" ","p"," ",
                  " ","p"," ",
                  " ","p"," "]
    board.matching_columns?.should eq(true)
  end

  it "should know if column has won with last set" do
    board.grid = [" "," ","t",
                  " "," ","t",
                  " "," ","t"]
    board.matching_columns?.should eq(true)
  end

  it "should return false if forwardslash diagonal set has not won" do
    board.matching_forwardslash?.should eq(false)
  end

  it "should know if forwardslash diagonal set has won" do
    board.grid = [" "," ","o",
                  " ","o"," ",
                  "o"," "," "]
    board.matching_forwardslash?.should eq(true)
  end

  it "should return false if diagonal has not won" do
    board.matching_backslash?.should eq(false)
  end

  it "should know if diagonal has won" do
    board.grid = ["x"," "," ",
                  " ","x"," ",
                  " "," ","x"]
    board.matching_backslash?.should eq(true)
  end

  it "should know if game is over" do
    board.grid = ["o","o","o"," "," "," "," "," "," "]
    board.matching_rows?
    board.winner_value.should eq("o")
  end

  it "should check if given group is matching" do
    group = ["o","o","o"]
    board.group_match?(group).should eq(true)
  end

  it "should return false if given group is not matching" do
    group = ["x","o","o"]
    board.group_match?(group).should eq(nil)
  end

  it "should return false if given group is not matching" do
    group = ["o","x","o"]
    board.group_match?(group).should eq(nil)
  end

  it "should return false if given group is not matching" do
    group = ["o","o","x"]
    board.group_match?(group).should eq(nil)
  end

  it "should return false if given group is not matching" do
    group = ["o","o"," "]
    board.group_match?(group).should eq(nil)
  end

  it "should return false if given group is not matching" do
    group = ["o"," ","o"]
    board.group_match?(group).should eq(nil)
  end

  it "should return false if given group is not matching" do
    group = [" ", " ", " "]
    board.group_match?(group).should eq(nil)
  end

  it "should return nested arry of all possible wins" do
    board.possible_wins.length.should eq(8)
  end

  it "should return nested array for rows" do
    board.row_sections[2].class.should eq(Array)
  end

  it "should return nested array for columns" do
    board.column_sections[2].class.should eq(Array)
  end

  it "should return nested array for forwardslash " do
    board.forwardslash_section[0].class.should eq(Array)
  end

  it "should return nested array for backslash " do
    board.backslash_section[0].class.should eq(Array)
  end
end
