class ComputerAi

  def initialize(game_piece, opponent)
    @game_piece = game_piece
    @enemy_piece = opponent
    @game = GamePlay.new
  end

  def assert_values(board)
    position_values = []
    board.each_with_index do |empty_position, empty_index|
      next if empty_position != nil
      possible_game = board.dup
      possible_game[empty_index] = @game_piece
      puts "#{possible_game}"
      position_values[empty_index] = evaluate_board(possible_game, @enemy_piece, @game_piece)
    end
    # puts "#{position_values}"
    position_values.index(position_values.compact.max)
  end

  def evaluate_board(board, current, passing)
    return create_value(board) if gameover?(board)
    board_values = []
    board.each_with_index do |empty_position, empty_index|
      next if empty_position != nil
      played_board = board.dup
      played_board[empty_index] = current
      board_values[empty_index] = evaluate_board(played_board, passing, current)
    end
    puts "board values: #{board_values}"
    if current == @game_piece
      best_value = board_values.compact.max
      @new_position = board_values.index(best_value)
      return best_value
    else
      best_value = board_values.compact.min
      @new_position = board_values.index(best_value)
      return best_value
    end
  end

  def gameover?(board)
    @game.set_board_values(board)
    @game.gameover?
  end

  def create_value(board)
    @game.set_board_values(board)
    return  1 if @game.who_won? == @game_piece
    return -1 if @game.who_won? == @enemy_piece
    return  0 if @game.tie_game?
  end

end
