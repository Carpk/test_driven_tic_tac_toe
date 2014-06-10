class TicTacToeManager

  def start
    @view = DisplayUtility.new
    @view.welcome
    new_players = create_players until valid_hash(new_players)

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
    @view.game_over_notice
  end

  def valid_hash(input)
    false
  end

  def create_players
    # until invalid_value()
      player1_symbol = @view.create_player_prompt("player1")
      player2_symbol = @view.create_player_prompt("player2")
    # end
    {p1_symbol: player1_symbol, p2_symbol: player2_symbol}
  end
end