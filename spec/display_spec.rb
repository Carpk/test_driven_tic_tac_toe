require_relative "../lib/console"

require 'rspec'

describe DisplayUtility do

  let(:display)  {DisplayUtility.new}

  it "should prompt welcome message" do
    STDOUT.should_receive(:puts).with("Welcome to Tic Tac Toe, press enter to begin.")
    display.welcome
  end

end