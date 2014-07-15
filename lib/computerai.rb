class ComputerAi

  def initialize(params)
    @game_piece = params[:symbol]
    @enemy_piece = params[:opponent]        # make into a single hash object?
  end

  def assert_values(board)
    position_values = {}
    board.indexes_of_available_spaces.each do |empty_position|
      possible_board = Marshal.load( Marshal.dump(board) )
      possible_board.assign_token_to(@game_piece, empty_position)
      position_values[empty_position] = evaluate_board(possible_board, @enemy_piece, @game_piece)
    end
    # puts "values: #{position_values}"
    hash_selector(position_values)
  end

  def evaluate_board(board, current_player, passing_player, depth=1)
    return create_value(board) / depth if gameover?(board) || depth > 6  # tests pass with 6
    board_values = []
    board.indexes_of_available_spaces.each do |empty_position|
      played_board = Marshal.load( Marshal.dump(board) )
      played_board.assign_token_to(current_player, empty_position)
      board_values << evaluate_board(played_board, passing_player, current_player, depth +1)
    end

    if current_player == @game_piece
      board_values.compact.max
    else
      board_values.compact.min
    end
  end

  def hash_selector(position_values)
    best_positions = []
    max_value = position_values.each_value.max
    position_values.each_pair do |index, value|
      best_positions << index if value == max_value
    end
    best_positions.sample
  end

  def gameover?(board)
    GameValues.gameover?(board)
  end

  def create_value(board)
    returning_value =  0
    returning_value =  1.0 if GameValues.winner_of(board) == @game_piece
    returning_value = -1.0 if GameValues.winner_of(board) == @enemy_piece
    returning_value =  0.0 if GameValues.tie_game?(board)
    returning_value
  end

end

