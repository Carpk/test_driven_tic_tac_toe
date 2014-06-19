class GamePlay
  attr_reader :current_player
  def initialize
    @board = TicTacToeBoard.new
  end

  def create_players(params)
    player1 = Player.new(params[:player1_symbol]) # pass true if player is AI
    player2 = Player.new(params[:player2_symbol])
    @players = {p1: {next: :p2, player: player1}, p2: {next: :p1, player: player2}}
    @current_player = @players[:p1]
  end

  def gameover?                                    # remove or fix
    game_winner?
    return true if @board.board_full?
    false
  end

  def game_winner?
    return true if @board.matching_rows?
    return true if @board.matching_columns?
    return true if @board.matching_forwardslash?
    return true if @board.matching_backslash?
    false
  end

  def set_board_values(new_board)
    @board.grid = new_board
  end

  def player_move_to(position)          # add something here for ai transfer
    token = @current_player[:player].game_piece
    # position = computer_turn if @current_player[:player].ai == true
    @board.assign_token_to(token, position)
    @current_player = @players[@current_player[:next]]
  end

  def computer_turn
    @current_player[:player].game_to_ai(self)
  end

  def display_board
    @board.grid
  end

  def who_won?
    @board.winner_value
  end

  def tie_game?
    @board.board_full? && game_winner? == false
  end
end
