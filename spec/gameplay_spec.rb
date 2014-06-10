require_relative "../lib/console"

require 'rspec'

describe GamePlay do

  let(:game)  {GamePlay.new({p1_symbol:"x",p2_symbol:"o"})}


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

  it "should create a players hash" do
    params = {p1_symbol:"x",p2_symbol:"o"}
    game.create_players_hash(params).class.should eq(Hash)
  end

end