require_relative "../lib/console"

require 'rspec'

describe Player do

  let(:player)  {Player.new("x")}

  it "should return correct player game peice" do
    player.game_peice.should eq("x")
  end

end