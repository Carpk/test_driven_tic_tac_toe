require_relative "../lib/console"

require 'rspec'

describe GamePlay do

  let(:game)      {GamePlay.new}

  it "should create new players from hash" do
    hash = {player1_symbol:"x",player2_symbol:"o"}
    game.create_players(hash).class.should eq(Hash)
  end

  it "should know if game is over" do
    game.create_players({player1_symbol:"x",player2_symbol:"o"})
    game.gameover?.should eq(false)
  end

  it "should know if game is over" do
    board = [nil, "o", nil,
             nil, "o", nil,
             nil, "o", nil]
    game.set_board_values(board)
    game.gameover?.should eq(true)
  end

  it "should know if game is over" do
    board = ["x", "o", "x",
             "o", "x", "o",
             "o", "x", "o"]
    game.set_board_values(board)
    game.gameover?.should eq(true)
  end

  it "should know if game is not over" do
    board = [nil, "o", "x",
             "o", "x", "o",
             "o", "x", "o"]
    game.set_board_values(board)
    game.gameover?.should eq(false)
  end

  it "should know if game has a no winner" do
    board = [nil, nil, "x",
             nil, "o", nil,
             nil, nil, "o"]
    game.set_board_values(board)
    game.game_winner?.should eq(false)
  end

  # it "should know if game has a forwardslash winner" do
  #   board = ["o", nil, "x",
  #            nil, "o", nil,
  #            nil, nil, "o"]
  #   game.set_board_values(board)
  #   game.game_winner?.should eq(true)
  # end

  it "display board should be of the correct length" do
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

  it "should correctly set board values" do
    board = [nil, nil, nil,
             nil, "o", nil,
             nil, nil, nil]
    game.set_board_values(board)
    game.display_board[4].should eq("o")
  end

  it "should move player to correct position" do
    game.create_players({player1_symbol:"x",player2_symbol:"o"})
    game.player_move_to(5)
    game.display_board[5].should eq("x")
  end

  it "should return who won the game" do
    board = ["x", "x", "x",
             nil, "o", nil,
             nil, nil, nil]
    game.set_board_values(board)
    game.who_won?.should eq("x")
  end

  it "should return who won the game" do
    board = ["x", "o", "x",
             nil, "o", nil,
             nil, "o", nil]
    game.set_board_values(board)
    game.who_won?.should eq("o")
  end

  it "should know the game is a tie" do
    new_board = ["o", "x", "o",
                 "x", "o", "x",
                 "x", "o", "x"]
    game.set_board_values(new_board)
    game.tie_game?.should eq(true)
  end

  it "should know there is no tie with winner" do
    new_board = ["o", "x", "o",
                 "x", "x", "x",
                 "o", "o", "x"]
    game.set_board_values(new_board)
    game.tie_game?.should eq(false)
  end

  it "should know there is no tie with incomplete game" do
    new_board = ["o", "x", "o",
                 "x", nil, "x",
                 "o", "o", "x"]
    game.set_board_values(new_board)
    game.tie_game?.should eq(false)
  end
end