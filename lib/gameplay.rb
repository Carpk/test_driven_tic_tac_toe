class GamePlay
  attr_reader :current_player

  def initialize(board)
    @board = board
  end

  def gameover?
    @board.board_full? ||
    board_has_winner?
  end

  def tie_game?
    @board.board_full? && board_has_winner? == false
  end

  def board_has_winner?
    value = false
    @board.possible_wins.each do |section|
      value = true if self.group_match?(section)
    end
    value
  end

  def winner_of
    @board.possible_wins.each do |section|
      return section.first if group_match?(section)
    end
  end

  def group_match?(section)
    section.rotate == section.delete_if {|e| " " == e}
  end

  def create_players(params)
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    @players = {p1: {next: :p2, player: player1},
                p2: {next: :p1, player: player2}}
    @current_player = @players[:p1]
  end

  def available_spaces
    @board.indexes_of_available_spaces
  end

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
