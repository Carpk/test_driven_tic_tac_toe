class TicTacToeBoard
  attr_accessor :grid, :winner_value

  def initialize
    @grid = Array.new(9)
    @winner_value = false
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

  def square_root_of_board
    Math.sqrt(@grid.length).to_i
  end

  def matching_rows
    @grid.each_slice(square_root_of_board) do |win_attempt|
      return @winner_value = win_attempt.first if win_attempt.compact == win_attempt.rotate
    end
    false
  end

  def matching_columns
    board_divisor = square_root_of_board
    board_divisor.times do |index|
      win_attempt = [@grid[index], @grid[index + board_divisor], @grid[index + board_divisor * 2]]
      return @winner_value = win_attempt.first if win_attempt.compact == win_attempt.rotate
    end
    false
  end

  def matching_forwardslash
    index_offset = 0
    forwardslash = []
    @grid.each_slice(square_root_of_board) do |win_attempt|
      forwardslash << win_attempt[-1 - index_offset]
      index_offset += 1
    end
    return @winner_value = forwardslash.first if forwardslash.compact == forwardslash.rotate
    false
  end

  def matching_backslash
    index_offset = 0
    backslash = []
    @grid.each_slice(square_root_of_board) do |win_attempt|
      backslash << win_attempt[0 + index_offset]
      index_offset += 1
    end
    return @winner_value = backslash.first if backslash.compact == backslash.rotate
    false
  end

  def who_won?
    return matching_rows if matching_rows
    return matching_columns if matching_columns
    return matching_forwardslash if matching_forwardslash
    return matching_backslash if matching_backslash

    return true unless unassigned_positions?
  end
end
