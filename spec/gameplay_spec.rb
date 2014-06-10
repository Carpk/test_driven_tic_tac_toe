require_relative "../lib/console"

require 'rspec'

describe GamePlay do

  let(:game)  {GamePlay.new({p1_symbol:"x",p2_symbol:"o"})}

  it "should know correct amount of differant winning combinations" do
    game.winning_combos_positions.length.should eq(8)
  end

  it "should know if game is over" do
    game.gameover?.should eq(false)
  end

  it "should show game board" do
    game.display_board.length.should eq(9)
  end

  it "game token should occupy position" do
    game.player_move_to(3)
    game.display_board[3].should eq("x")
  end

  it "should know if row has won" do
    game.winning_rows.should eq(false)
  end

  it "should know if column has won" do
    game.winning_columns.should eq(false)
  end

  it "should know if diagonal has won" do
    game.winning_diagonals.should eq(false)
  end
end