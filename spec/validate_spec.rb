require_relative "../lib/console"

require 'rspec'

describe InputValidator do

  let(:validate)  {InputValidator.new}


  it "should validate if hash is acceptable" do
    hash = {player1_symbol: "1", player2_symbol: "2"}
    validate.valid_hash?(hash).should eq(true)
  end

  it "should not validate if token is less than 1 character" do
    hash = {player1_symbol: "", player2_symbol: "2"}
    validate.valid_hash?(hash).should eq(false)
  end

  it "should not validate if token is greater than 1 character" do
    hash = {player1_symbol: "1", player2_symbol: "tree"}
    validate.valid_hash?(hash).should eq(false)
  end

  it "should not validate if both tokens are the same" do
    hash = {player1_symbol: "g", player2_symbol: "g"}
    validate.valid_hash?(hash).should eq(false)
  end

  it "should validate if move is acceptable" do
    move = "3"
    validate.valid_move?(move).should eq(true)
  end

  it "should not validate if move too great of a number" do
    move = "12"
    validate.valid_move?(move).should eq(false)
  end

  it "should not validate if move is empty" do
    move = ""
    validate.valid_move?(move).should eq(false)
  end

  it "should not validate if move is a string" do
    move = "tree"
    validate.valid_move?(move).should eq(false)
  end
end
