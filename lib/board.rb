class TicTacToeBoard
  attr_accessor :grid, :winner_value

  def initialize(board = Array.new(9," ") )        #fix method names
    @grid = board
    @winner_value = false
  end

  def unassigned_positions?
    @grid.include?(" ")
  end

  def board_full?
    !unassigned_positions?
  end

  def assign_token_to(token, position)
    @grid[position] = token
  end

  def board_side_length
    Math.sqrt(@grid.length).to_i
  end

  def indexes_of_available_spaces
    available_indexes = []
    @grid.each_with_index do |value, index|
      available_indexes << index if value == " "
    end
    available_indexes
  end

  def matching_rows?
    match_value = false
    @grid.each_slice(board_side_length) do |win_attempt|
      match_value = true if group_match?(win_attempt) == true
    end
    match_value
  end

  def matching_columns?
    match_value = false
    board_divisor = board_side_length
    board_divisor.times do |index|
      win_attempt = [@grid[index], @grid[index + board_divisor], @grid[index + board_divisor * 2]]
      match_value = true if group_match?(win_attempt) == true
    end
    match_value
  end

  def matching_forwardslash?
    match_value = false
    index_offset = 0
    forwardslash = []
    @grid.each_slice(board_side_length) do |win_attempt|
      forwardslash << win_attempt[-1 - index_offset]
      index_offset += 1
    end
    match_value = true if group_match?(forwardslash) == true
    match_value
  end

  def matching_backslash?
    match_value = false
    index_offset = 0
    backslash = []
    @grid.each_slice(board_side_length) do |win_attempt|
      backslash << win_attempt[0 + index_offset]
      index_offset += 1
    end
    match_value = true if group_match?(backslash) == true
    match_value
  end

  def group_match?(group)
    if group.rotate == group.delete_if {|e| " " == e}
      @winner_value = group.first  # get rid of this
      true
    end
  end



  def possible_wins
    all_combos = []
    all_combos.concat(row_sections)
    all_combos.concat(column_sections)
    all_combos.concat(forwardslash_section)
    all_combos.concat(backslash_section)
    all_combos
  end

  def row_sections
    rows_values = []
    @grid.each_slice(board_side_length) do |win_attempt|
      rows_values << win_attempt
    end
    rows_values
  end

  def column_sections
    column_values = []
    board_divisor = board_side_length
    board_divisor.times do |index|
      column_values << [@grid[index], @grid[index + board_divisor], @grid[index + board_divisor * 2]]
    end
    column_values
  end

  def forwardslash_section
    index_offset = 0
    forwardslash = []
    @grid.each_slice(board_side_length) do |row|
      forwardslash << row[-1 - index_offset]
      index_offset += 1
    end
    [forwardslash]
  end

  def backslash_section
    index_offset = 0
    backslash = []
    @grid.each_slice(board_side_length) do |row|
      backslash << row[0 + index_offset]
      index_offset += 1
    end
    [backslash]
  end

end
