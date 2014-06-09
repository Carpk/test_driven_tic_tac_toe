class GamePlay

  def initialize(params)
    @board = TicTacToeBoard.new
    @p1 = Player.new(params[:p1_symbol])
    @p2 = Player.new(params[:p2_symbol])
  end

  def gameover?
    return false unless @board.unassigned_positions?
    grid = @board.grid
    winning_combos_positions.each do |set|
      next if [grid[set[0]], grid[set[1]], grid[set[2]]].include?(nil)
      return true if [grid[set[0]], grid[set[1]], grid[set[2]]] == [grid[set[2]], grid[set[0]], grid[set[1]]]
    end
    false
  end

  def display_board
    @board.present_board
  end

  def winning_combos_positions
    [[0,1,2],[3,4,5],
     [6,7,8],[0,3,6],
     [1,4,7],[2,5,8],
     [0,4,8],[2,4,6]]
  end
end