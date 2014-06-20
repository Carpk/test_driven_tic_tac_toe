require_relative "../lib/console"

require 'rspec'

describe TicTacToeBoard do

  let(:board)  {TicTacToeBoard.new}

  it "should return the correct length of board" do
    board.grid.length.should eq(9)
  end

  it "should be true for having unassigned positions on board" do
    board.unassigned_positions?.should eq(true)
  end

  it "should be false for empty board" do
    board.board_full?.should eq(false)
  end

  it "should be false for empty board" do
    board.grid = ["o", "x", "o",
                  "x", "o", "x",
                  "x", "o", "x"]
    board.board_full?.should eq(true)
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
    board.matching_rows?.should eq(false)
  end

  it "should know if row set has won with top set" do
    board.grid = ['f','f','f',
                  nil,nil,nil,
                  nil,nil,nil]
    board.matching_rows?.should eq("f")
  end

  it "should know if row set has won with middle set" do
    board.grid = [nil,nil,nil,
                  "e","e","e",
                  nil,nil,nil]
    board.matching_rows?.should eq("e")
  end

  it "should know if row set has won with bottom set" do
    board.grid = [nil,nil,nil,
                  nil,nil,nil,
                  "g","g","g"]
    board.matching_rows?.should eq("g")
  end

  it "should know if column set has won" do
    board.matching_columns?.should eq(false)
  end

  it "should know if column set has won" do
    board.grid = [nil,nil,"t",nil,nil,"t",nil,nil,"t"]
    board.matching_columns?.should eq("t")
  end

  it "should know if diagonal set has won" do
    board.matching_forwardslash?.should eq(false)
  end

  it "should know if diagonal set has won" do
    board.grid = [nil,nil,"o",nil,"o",nil,"o",nil,nil]
    board.matching_forwardslash?.should eq("o")
  end

  it "should know if diagonal has won" do
    board.matching_backslash?.should eq(false)
  end

  it "should know if diagonal has won" do
    board.grid = ["x",nil,nil,nil,"x",nil,nil,nil,"x"]
    board.matching_backslash?.should eq("x")
  end

  # it "should know if game is over" do             #to be removed
  #   board.gameover?.should eq(false)
  # end

  # it "should know if game is over" do             #to be removed
  #   board.grid = [nil,nil,"o",nil,"o",nil,"o",nil,nil]
  #   board.gameover?.should eq(true)
  # end

  it "should know if game is over" do
    board.grid = ["o","o","o",nil,nil,nil,nil,nil,nil]
    board.matching_rows?
    board.winner_value.should eq("o")
  end

  # it "should know if game is over" do
  #   board.gameover?.should eq(false)
  # end

  # it "should know if game is over" do
  #   board.gameover?.should eq(false)
  # end
end