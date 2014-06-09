require_relative "../lib/console"

require 'rspec'

describe Player do

  let(:player)  {Player.new("x")}

  it "should return correct player game piece" do
    player.game_piece.should eq("x")
  end

end