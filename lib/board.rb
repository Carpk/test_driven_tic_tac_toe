class TicTacToeBoard
  attr_reader :grid

  def initialize
    @grid = Array.new(9)
  end

  def unassigned_positions?
    @grid.include?(nil)
  end

end