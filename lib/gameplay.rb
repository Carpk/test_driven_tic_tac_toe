class GamePlay
  attr_reader :current_player

  def initialize(board = Array.new(9," "))
    @board = TicTacToeBoard.new(board)
  end

  def create_players(params)
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    @players = {p1: {next: :p2, player: player1},
                p2: {next: :p1, player: player2}}
    @current_player = @players[:p1]
  end

  def gameover?
    GameValues.gameover?(@board)
  end

  def game_winner?
    GameValues.board_has_winner?(@board)
  end

  def available_spaces
    @board.indexes_of_available_spaces
  end

  # def set_board_values(new_board)
  #   @board.grid = new_board
  # end

  def player_move_to(position)
    token = @current_player[:player].game_piece
    @board.assign_token_to(token, position)
    @current_player = @players[@current_player[:next]]
  end

  def computer_turn
    board = @board.clone
    @current_player[:player].game_to_ai(board)
  end

  def display_board
    @board.grid
  end

end
