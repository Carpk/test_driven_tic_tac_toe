class ComputerAi

  def evaluate_board(board, current, passing) # board should be Board object?
    return create_value if board.gameover?

    board.grid.each_with_index do |empty_position, empty_index|
      next if empty_position != nil
      played_board = board.clone
      # played_board = Marshal::load(Marshal.dump(board))
      played_board.grid[empty_index] = current
      evaluate_board(played_board, passing, current)
    end
  end


  def create_value

  end

end
