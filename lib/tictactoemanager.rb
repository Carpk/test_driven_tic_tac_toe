class TicTacToeManager

  def initialize
    @view = DisplayUtility.new
    # @view.welcome
  end

  def start
    new_players = valid_players_hash
    @game = GamePlay.new(new_players)
    play
  end

  def play
    until @game.gameover?
      board = @game.display_board
      @view.display_board(board)
      position = @view.prompt_player_move
      @game.player_move_to(position.to_i)
    end
    @view.display_board(@game.display_board)
    @view.gameover_notice
  end

  def valid_players_hash
    players_hash = prompt_for_players
    until valid_hash?(players_hash)
      @view.invalid_input_error
      players_hash = prompt_for_players
    end
    players_hash
  end

  def prompt_for_players
    player1 = @view.create_player_prompt("player1")
    player2 = @view.create_player_prompt("player2")
    {player1_symbol: player1, player2_symbol: player2}
  end

  def valid_hash?(input)
    input.each_value {|user_input| return false if user_input.length != 1}
    true
  end

end