require_relative "../lib/console"

require 'rspec'

describe GamePlay do

  let(:game)      {GamePlay.new}

  it "should know if game is over" do
    game.create_players({player1_symbol:"x",player2_symbol:"o"})
    game.gameover?.should eq(false)
  end

  it "should show game board" do
    game.create_players({player1_symbol:"x",player2_symbol:"o"})
    game.display_board.length.should eq(9)
  end

  it "game token should occupy position" do
    game.create_players({player1_symbol:"x",player2_symbol:"o"})
    game.player_move_to(3)
    game.display_board[3].should eq("x")
  end

  it "should create a players hash" do
    params = {player1_symbol:"x",player2_symbol:"o"}
    game.create_players(params).class.should eq(Hash)
  end

  it "should set board values" do
    board = [nil, nil, nil, nil, "o", nil, nil, nil, nil]
    game.set_board_values(board)
    game.display_board[4].should eq("o")
  end

  # it "should send the current Game to Ai" do
  #   game.create_players({player1_symbol:"x",player2_symbol:"o"})
  #   game.computer_turn.should eq(nil)
  # end

  it "should return who won the game" do
    board = ["x", "x", "x", nil, "o", nil, nil, nil, nil]
    game.set_board_values(board)
    game.gameover?
    game.who_won?.should eq("x")
  end
end