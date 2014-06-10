class GamePlay

  def initialize(params)
    @board = TicTacToeBoard.new
    @players = create_players_hash(params)
    @current_player = @players[:p1]
  end

  def gameover?
    return true unless @board.unassigned_positions?

    return true if @board.matching_rows
    return true if @board.matching_columns
    return true if @board.matching_forwardslash
    return true if @board.matching_backslash

    false
  end

  def player_move_to(position)
    token = @current_player[:player].game_piece
    @board.assign_token_to(token, position)
    @current_player = @players[@current_player[:next]]
  end

  def display_board
    @board.present_board
  end

  def create_players_hash(params)
    player1 = Player.new(params[:p1_symbol])
    player2 = Player.new(params[:p2_symbol])
    @players = {p1: {next: :p2, player: player1}, p2: {next: :p1, player: player2}}
  end
end