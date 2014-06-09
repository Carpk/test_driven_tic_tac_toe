class TicTacToe

  def start
    @view = DisplayUtility.new
    @view.welcome
    params = Hash.new
    params[:p1_symbol] = @view.create_player_prompt("player1")
    params[:p2_symbol] = @view.create_player_prompt("player2")
    @game = GamePlay.new(params)
    play
  end

  def play
    unless @game.gameover?
      @view.display_board(@game.display_board)
      move = @view.prompt_player_move
      @game
    end
  end

end