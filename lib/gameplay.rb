class GamePlay
  attr_reader :current_player

  def initialize(board)
    @board = board
  end

  # def self.gameover?(board)
  #   board.board_full? ||
  #   self.board_has_winner?(board)
  # end

  # def self.tie_game?(board)
  #   board.board_full? && self.board_has_winner?(board) == false
  # end

  # def self.board_has_winner?(board)
  #   value = false
  #   board.possible_wins.each do |section|
  #     value = true if self.group_match?(section)
  #   end
  #   value
  # end

  # def self.winner_of(board)
  #   board.possible_wins.each do |section|
  #     return section.first if self.group_match?(section)
  #   end
  # end

  # def self.group_match?(section)
  #   section.rotate == section.delete_if {|e| " " == e}
  # end

  def create_players(params)
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    @players = {p1: {next: :p2, player: player1},
                p2: {next: :p1, player: player2}}
    @current_player = @players[:p1]
  end

  def gameover?
    BoardValues.gameover?(@board)
  end

  def game_winner? #(board)
    BoardValues.board_has_winner?(@board)
  end

  def available_spaces
    @board.indexes_of_availablespaces
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
