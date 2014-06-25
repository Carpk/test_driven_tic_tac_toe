class TicTacToeBoard
  attr_accessor :grid, :winner_value

  def initialize
    @grid = Array.new(9)
    @winner_value = false
  end

  def unassigned_positions?
    @grid.include?(nil)
  end

  def board_full?
    !unassigned_positions?
  end

  def assign_token_to(token, position)
    @grid[position] = token
  end

  def square_root_of_board
    Math.sqrt(@grid.length).to_i
  end

  def matching_rows?
    @grid.each_slice(square_root_of_board) do |win_attempt|
      if win_attempt.compact == win_attempt.rotate
        @winner_value = win_attempt.first
        return true
      end
    end
    false
  end

  def matching_columns?
    board_divisor = square_root_of_board
    board_divisor.times do |index|
      win_attempt = [@grid[index], @grid[index + board_divisor], @grid[index + board_divisor * 2]]
      if win_attempt.compact == win_attempt.rotate
        @winner_value = win_attempt.first
        return true
      end
    end
    false
  end

  # rid of explict returns
  # fix method names

  def matching_forwardslash?
    index_offset = 0
    forwardslash = []
    @grid.each_slice(square_root_of_board) do |win_attempt|
      forwardslash << win_attempt[-1 - index_offset]
      index_offset += 1
    end

    if forwardslash.compact == forwardslash.rotate
      @winner_value = forwardslash.first
      true
    else
      false
    end
  end

  def matching_backslash?
    index_offset = 0
    backslash = []
    @grid.each_slice(square_root_of_board) do |win_attempt|
      backslash << win_attempt[0 + index_offset]
      index_offset += 1
    end

    if backslash.compact == backslash.rotate
      @winner_value = backslash.first
      true
    else
      false
    end
  end

end
