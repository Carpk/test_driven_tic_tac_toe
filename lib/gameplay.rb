class GamePlay
  attr_reader :current_player

  def initialize
    @board = TicTacToeBoard.new
  end

  def create_players(params)
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    @players = {p1: {next: :p2, player: player1},
                p2: {next: :p1, player: player2}}
    @current_player = @players[:p1]
  end

  def gameover?
    game_winner? || @board.board_full?
  end

  def game_winner?
    @board.matching_rows?         ||
    @board.matching_columns?      ||
    @board.matching_forwardslash? ||
    @board.matching_backslash?
  end

  def set_board_values(new_board)
    @board.grid = new_board
  end

  def player_move_to(position)
    token = @current_player[:player].game_piece
    @board.assign_token_to(token, position)
    @current_player = @players[@current_player[:next]]
  end

  def computer_turn
    board = @board.grid
    @current_player[:player].game_to_ai(board)
  end

  def display_board
    @board.grid
  end

  def who_won?(new_board)
    set_board_values(new_board)
    gameover?
    @board.winner_value
  end

  def tie_game?(new_board)
    set_board_values(new_board)
    @board.board_full? && game_winner? == false
  end
end
