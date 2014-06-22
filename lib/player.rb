class Player
  attr_reader :game_piece, :ai

  def initialize(game_piece, ai = false)
    @game_piece = game_piece
    create_ai if ai
  end

  def create_ai
    @ai = ComputerAi.new("x", "o")
  end

  # def game_to_ai(game)
  #   @ai.assess_game(game)
  # end

end
