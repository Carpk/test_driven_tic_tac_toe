class Player
  attr_reader :game_piece, :ai

  def initialize(params)
    @game_piece = params[:symbol]
    create_ai if check_for_ai(params[:ai])
  end

  def create_ai
    @ai = ComputerAi.new("x", "o")
  end

  def check_for_ai(ai_switch)
    ai_switch[0].downcase == "y"
  end

  def game_to_ai(board)
    @ai.assert_values(board)
  end

end
