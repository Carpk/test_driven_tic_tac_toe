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
      possible_board = board.dup
      possible_board[empty_index] = @game_piece
      position_values[empty_index] = evaluate_board(possible_board, @enemy_piece, @game_piece)
    end
    puts
    puts "board: #{board}, values: #{position_values}"             # REMOVE
    position_values.index(position_values.compact.max)
  end

  def evaluate_board(board, current_player, passing_player, depth=0)
    return (create_value(board) + depth) if gameover?(board)
    board_values = []
    board.each_with_index do |empty_position, empty_index|
      next if empty_position != nil
      played_board = board.dup
      played_board[empty_index] = current_player
      board_values[empty_index] = evaluate_board(played_board, passing_player, current_player, depth -1)
    end

    if current_player == @game_piece
      best_value = board_values.compact.max
      # @new_position = board_values.index(best_value)
      best_value
    else
      best_value = board_values.compact.min
      # @new_position = board_values.index(best_value) # new_position?
      best_value
    end
  end

  def gameover?(board)
    @game.set_board_values(board)
    @game.gameover?
  end

  def create_value(board)
    return  1 if @game.who_won?(board) == @game_piece
    return -1 if @game.who_won?(board) == @enemy_piece
    return  0 if @game.tie_game?
  end

end
