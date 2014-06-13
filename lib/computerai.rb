class ComputerAi

  def initialize(game_piece, opponent)
    @game_piece = game_piece
    @enemy_piece = opponent
  end

  def assess_game(game, current_player = @game_piece, passing_player = @enemy_piece)
    return create_value(game) if game.gameover?
    game_values = []

    game.display_board.each_with_index do |empty_position, empty_index|
      next if empty_position != " "
      played_game = game.clone
      played_game.display_board[empty_index] = current_player #broken
      game_values[empty_index] = assess_game(played_game, passing_player, current_player)
    end
    game_values
  end

  # def assert_values(board)
  #   possible_game = GamePlay.new
  #   possible_game.set_board_values(board)

  # end

  # def evaluate_board(board, current, passing) # board should be Board object?
  #   return create_value(board) + depth if board.gameover?
  #   board_values = []
  #   depth -= 1

  #   board.grid.each_with_index do |empty_position, empty_index|
  #     next if empty_position != nil
  #     # played_board = Marshal::load(Marshal.dump(board))
  #     played_board = board.clone
  #     played_board.grid[empty_index] = current
  #     board_values[empty_index] = evaluate_board(played_board, passing, current)
  #   end
  #   board_values
  # end


  def create_value(game)
    return  10 if game.who_won? == @game_piece
    return -10 if game.who_won? == @enemy_piece
    return   0 if game.who_won? == true
  end

end
