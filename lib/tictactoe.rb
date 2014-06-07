class TicTacToe

  # def initialize
  #   @view = DisplayUtility.new
  # end

  def self.start
    @view = DisplayUtility.new
    @view.welcome
    params = Hash.new
    params[:p1_symbol] = @view.create_player_prompt("player1")
    params[:p2_symbol] = @view.create_player_prompt("player2")
    @game = GamePlay.new(params)
  end

end