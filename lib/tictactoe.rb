class TicTacToe

  def self.start
    @view = DisplayUtility.new
    @view.welcome
    params = Hash.new
    params[:p1_symbol] = @view.create_player_prompt("player1")
    params[:p2_symbol] = @view.create_player_prompt("player2")
    @game = GamePlay.new(params)
    play
  end

  def self.play
    unless @game.gameover?
      @view.display_board(@game.display_board)

    end
  end

end