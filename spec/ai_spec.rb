require_relative "../lib/console"

require 'rspec'

describe ComputerAi do

  let(:computer)  {ComputerAi.new}

  it "should determine the next position to move to" do
    board = ["x", "x", nil, "o", nil, "o", nil, nil, nil]
    computer.evaluate_board(board).should eq(2)
  end
end
