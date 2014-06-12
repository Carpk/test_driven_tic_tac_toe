class ComputerAi

  def evaluate_board(board, current, passing) # board should be Board object?
    return create_value if board_complete?(board)

    board.each_with_index do |empty_position, empty_index|
      next if empty_position != nil
      played_board = board.clone
      played_board[empty_index] = current
      evaluate_board(played_board, passing, current)
    end
  end

  def board_complete?(board)
    return true unless board.unassigned_positions?

    return true if board.matching_rows
    return true if board.matching_columns
    return true if board.matching_forwardslash
    return true if board.matching_backslash

    false
  end

  def create_value

  end

end
