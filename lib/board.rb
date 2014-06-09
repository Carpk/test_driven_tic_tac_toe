class TicTacToeBoard
  attr_reader :grid

  def initialize
    @grid = Array.new(9)
  end

  def unassigned_positions?
    @grid.include?(nil)
  end

  def assign_token_to(token, position)
    @grid[position] = token
  end

  def present_board
    pretty_board = @grid.dup
    pretty_board.each_with_index{|e,i| pretty_board[i] = " " if e == nil}
  end

end