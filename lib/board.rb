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
    match_value = false
    @grid.each_slice(square_root_of_board) do |win_attempt|
      match_value = true if group_check(win_attempt) == true
    end
    match_value
  end

  def matching_columns?
    match_value = false
    board_divisor = square_root_of_board
    board_divisor.times do |index|
      win_attempt = [@grid[index], @grid[index + board_divisor], @grid[index + board_divisor * 2]]
      match_value = true if group_check(win_attempt) == true
    end
    match_value
  end

  # fix method names

  def matching_forwardslash?
    match_value = false
    index_offset = 0
    forwardslash = []
    @grid.each_slice(square_root_of_board) do |win_attempt|
      forwardslash << win_attempt[-1 - index_offset]
      index_offset += 1
    end

    match_value = true if group_check(forwardslash) == true

    match_value
  end

  def matching_backslash?
    match_value = false
    index_offset = 0
    backslash = []
    @grid.each_slice(square_root_of_board) do |win_attempt|
      backslash << win_attempt[0 + index_offset]
      index_offset += 1
    end

    match_value = true if group_check(backslash) == true

    match_value
  end

  def group_check(group)
    if group.compact == group.rotate
      @winner_value = group.first
      true
    end
  end

end
