require_relative "../lib/console"

require 'rspec'

describe TicTacToeManager do

  let(:manage)  {TicTacToeManager.new}


  # it "should validate if hash is acceptable" do
  #   hash = {player1_symbol: "1", player2_symbol: "2"}
  #   manage.valid_hash?(hash).should eq(true)
  # end

  # it "should validate if hash is acceptable" do
  #   hash = {player1_symbol: "", player2_symbol: "2"}
  #   manage.valid_hash?(hash).should eq(false)
  # end

  # it "should validate if hash is acceptable" do
  #   hash = {player1_symbol: "1", player2_symbol: "tree"}
  #   manage.valid_hash?(hash).should eq(false)
  # end

  # it "should prompt for multiple players" do
  #   STDOUT.should_receive(:puts).with("Please enter your game piece symbol for player1:")
  #   STDIN.should_receive(:puts).and_return("\n")
  #   STDOUT.should_receive(:puts).with("Please enter your game piece symbol for player2:")
  #   STDIN.should_receive(:gets).and_return("\n")
  #    # stubs(:gets).and_return('yes', 'no', 'yes', 'yes', 'no')
  #   manage.prompt_for_players.should eq(nil)
  # end

  # it "should check for error in user input" do
  #   manage.create_players.should eq("x")
  # end
end
