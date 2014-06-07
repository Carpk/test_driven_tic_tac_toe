class GamePlay

  def initialize(params)
    @board = TicTacToeBoard.new
    @p1 = Player.new(params[:p1_symbol][0])
    @p2 = Player.new(params[:p2_symbol][0])
  end

  def gameover?
    return false unless @board.unassigned_positions?
    winning_combos_positions.each do |set|
      return true if [@board.grid[set[0]], @board.grid[set[1]], @board.grid[set[2]]].join == "XXX"
    end
    false
  end

  def winning_combos_positions
    [[0,1,2],[3,4,5],
     [6,7,8],[0,3,6],
     [1,4,7],[2,5,8],
     [0,4,8],[2,4,6]]
  end
end