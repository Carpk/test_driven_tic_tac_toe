require_relative "../lib/console"

require 'rspec'

describe DisplayUtility do

  let(:display)  {DisplayUtility.new}

  it "should verify if space is available on the board" do
    STDOUT.should_receive(:puts).with("Welcome to Tic Tac Toe")
    display.welcome
  end

end