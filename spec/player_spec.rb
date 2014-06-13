require_relative "../lib/console"

require 'rspec'

describe Player do

  let(:player)  {Player.new("x")}

  it "should return correct player game piece" do
    player.game_piece.should eq("x")
  end

  it "should create an Ai object" do
    player.create_ai.class.should eq(ComputerAi)
  end

  it "should create an Ai object" do
    computer = Player.new("o", true)
    computer.ai.class.should eq(ComputerAi)
  end
end