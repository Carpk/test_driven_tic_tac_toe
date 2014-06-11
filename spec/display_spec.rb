require_relative "../lib/console"

require 'rspec'

describe DisplayUtility do

  let(:display)  {DisplayUtility.new}

  it "should prompt welcome message" do
    STDOUT.should_receive(:puts).with("Welcome to Tic Tac Toe, press enter to begin.")
    display.welcome
  end

  it "should prompt for player to enter symbol" do
    STDOUT.should_receive(:puts).with("Please enter your game piece symbol for player:")
    display.create_player_prompt("player")
  end

  it "should prompt for player to enter position" do
    STDOUT.should_receive(:puts).with("Please enter your position on the keypad:")
    display.prompt_player_move
  end

  it "should prompt for player to enter position" do
    STDOUT.should_receive(:puts).with("Game Over!")
    display.gameover_notice
  end

  it "should prompt error message" do
    STDOUT.should_receive(:puts).with("There was an invalid option, please try again")
    display.invalid_input_error
  end
end