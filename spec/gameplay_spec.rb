require_relative "../lib/console"

require 'rspec'

describe GamePlay do

  let(:game)  {GamePlay.new({p1_symbol:"x",p1_symbol:"o"})}

  it "should know correct amount of differant winning combinations" do
    game.winning_combos_positions.length.should eq(8)
  end

  it "should know if game is over" do
    game.gameover?.should eq(false)
  end

  it "should show game board" do
    game.display_board.length.should eq(9)
  end
end