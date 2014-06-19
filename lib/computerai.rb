class ComputerAi
  attr_reader :new_position
  def initialize(game_piece, opponent)
    @game_piece = game_piece
    @enemy_piece = opponent
  end

  # def assert_values(game)
  #   position_values = []
  #   game.display_board.each_with_index do |empty_position, empty_index|
  #     next if empty_position != nil
  #     possible_game = game.clone
  #     possible_game.display_board[empty_index] = @game_piece
  #     played_value = evaluate_board(possible_game, @enemy_piece, @game_piece)
  #     position_values[empty_index] = played_value
  #     puts "#{played_value}"
  #   end
  #   position_values
  # end

  def evaluate_board(game, current_player = @game_piece, passing_player = @enemy_piece)
    return create_value(game) if game.gameover?
    game_values = []

    game.display_board.each_with_index do |empty_position, empty_index|
      next if empty_position != nil
      possible_game = game.clone
      possible_game.display_board[empty_index] = current_player
      returned_value = evaluate_board(possible_game, passing_player, current_player)
      game_values[empty_index] = returned_value
    end

    if current_player == @game_piece
      best_value = game_values.compact.max
      @new_position = game_values.index(best_value)
      return best_value
    else
      best_value = game_values.compact.min
      @new_position = game_values.index(best_value)
      return best_value
    end
  end

  # def assert_values(board)
  #   possible_game = GamePlay.new
  #   possible_game.set_board_values(board)
  # end

  # def evaluate_board(board, current, passing)      # this implementation will call methods to use other classes
  #   return create_value(board) if gameover?(board)
  #   board_values = []
  #   board.each_with_index do |empty_position, empty_index|
  #     next if empty_position != nil
  #     played_board = board.dup
  #     played_board[empty_index] = current
  #     board_values[empty_index] = evaluate_board(played_board, passing, current)
  #   end
  #   board_values
  # end


  def create_value(game)
    return  1 if game.who_won? == @game_piece
    return -1 if game.who_won? == @enemy_piece
    return  0 if game.tie_game?
  end

end
