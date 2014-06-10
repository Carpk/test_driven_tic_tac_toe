class TicTacToe

  def start
    @view = DisplayUtility.new
    @view.welcome
    new_players = Hash.new
    new_players[:p1_symbol] = @view.create_player_prompt("player1")
    new_players[:p2_symbol] = @view.create_player_prompt("player2")
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
  end

end