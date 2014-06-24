class GamePlay
  attr_reader :current_player
  def initialize
    @board = TicTacToeBoard.new
  end

  def create_players(params)
    player1 = Player.new(params[:player1]) # pass true if player is AI
    player2 = Player.new(params[:player2])
    @players = {p1: {next: :p2, player: player1}, p2: {next: :p1, player: player2}}
    @current_player = @players[:p1]
  end

  def gameover?
    @board.board_full? || game_winner?
  end

  def game_winner?
    @board.matching_rows? || @board.matching_columns? || @board.matching_forwardslash? || @board.matching_backslash?
  end

  def set_board_values(new_board)
    @board.grid = new_board
  end

  def player_move_to(position)
    token = @current_player[:player].game_piece
    puts @current_player[:player].ai\
    # position = computer_turn if @current_player[:player].ai == true
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

  def who_won?
    gameover?
    @board.winner_value
  end

  def tie_game?
    @board.board_full? && game_winner? == false
  end
end
