class ComputerAi

  def initialize(game_piece, opponent)
    @game_piece = game_piece
    @enemy_piece = opponent
  end

  def evaluate_board(board, current, passing) # board should be Board object?
    return create_value(board) + depth if board.gameover?
    board_values = []
    depth -= 1

    board.grid.each_with_index do |empty_position, empty_index|
      next if empty_position != nil
      played_board = board.clone
      # played_board = Marshal::load(Marshal.dump(board))
      played_board.grid[empty_index] = current
      board_values[empty_index] = evaluate_board(played_board, passing, current)
    end
    board_values
  end


  def create_value(grid)
    return  10 if grid.who_won? == @game_piece
    return -10 if grid.who_won? == @enemy_piece
    return   0 if grid.who_won? == true
  end

end
