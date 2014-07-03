class ComputerAi

  def initialize(params)
    @game_piece = params[:symbol]
    @enemy_piece = params[:opponent]
    @game = GamePlay.new
  end

  def assert_values(board)
    position_values = []
    board.each_with_index do |empty_position, empty_index|
      next if empty_position != nil
      possible_board = board.dup
      possible_board[empty_index] = @game_piece
      position_values[empty_index] = evaluate_board(possible_board, @enemy_piece, @game_piece)
    end

    # puts                                          # REMOVE AFTER TESTING
    # puts @game_piece                              # REMOVE AFTER TESTING
    # puts "board: #{board}"                        # REMOVE AFTER TESTING
    # puts "values: #{position_values.map {|e| e.to_s[0,5].to_f}}" # REMOVE AFTER TESTING

    random_position(position_values)
  end

  def random_position(position_values)
    optimal_indexes = []
    max_value = position_values.compact.max
    position_values.each_with_index do |position_value, board_position|
      optimal_indexes << board_position if position_value == max_value
    end
    # puts "optimal indexes: #{optimal_indexes}"         # REMOVE AFTER TESTING
    optimal_indexes.sample
  end

  def evaluate_board(board, current_player, passing_player, depth=1)
    return create_value(board) / depth if gameover?(board) || depth > 6  # tests pass with 6
    board_values = []
    board.each_with_index do |empty_position, empty_index|
      next if empty_position != nil
      played_board = board.dup
      played_board[empty_index] = current_player
      board_values << evaluate_board(played_board, passing_player, current_player, depth +1)
    end

    if current_player == @game_piece
      board_values.compact.max
    else
      board_values.compact.min
    end
  end

  def gameover?(board)
    @game.set_board_values(board)
    @game.gameover?
  end

  def create_value(board)
    returning_value =  0
    returning_value =  1.0 if @game.who_won?(board) == @game_piece
    returning_value = -1.0 if @game.who_won?(board) == @enemy_piece
    returning_value =  0.0 if @game.tie_game?(board)
    returning_value
  end

end

