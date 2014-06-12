class TicTacToeBoard
  attr_accessor :grid

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

  def gameover?
    return true unless unassigned_positions?

    return true if matching_rows
    return true if matching_columns
    return true if matching_forwardslash
    return true if matching_backslash

    false
  end

  def square_root_of_board
    Math.sqrt(@grid.length).to_i
  end

  def matching_rows
    @grid.each_slice(square_root_of_board) do |win_attempt|
      return true if win_attempt.compact == win_attempt.rotate
    end
    false
  end

  def matching_columns
    board_divisor = square_root_of_board
    board_divisor.times do |index|
      win_attempt = [@grid[index], @grid[index + board_divisor], @grid[index + board_divisor * 2]]
      return true if win_attempt.compact == win_attempt.rotate
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
    return true if forwardslash.compact == forwardslash.rotate
    false
  end

  def matching_backslash
    index_offset = 0
    backslash = []
    @grid.each_slice(square_root_of_board) do |win_attempt|
      backslash << win_attempt[0 + index_offset]
      index_offset += 1
    end
    return true if backslash.compact == backslash.rotate
    false
  end
end
