class GameValues

  def self.gameover?(array)
    board = TicTacToeBoard.new(array)
    board.board_full? ||
    self.board_has_winner?(array)
  end

  def self.tie_game?(array)
    board = TicTacToeBoard.new(array)
    board.board_full? && self.board_has_winner?(array) == false
  end

  def self.board_has_winner?(board)
    board = TicTacToeBoard.new(board)
    value = false
    board.possible_wins.each do |section|
      value = true if section.rotate == section.delete_if {|e| " " == e}
    end
    value
  end

  def self.winner_of(board)
    board = TicTacToeBoard.new(board)
    board.possible_wins.each do |section|
      return section.first if section.rotate == section.delete_if {|e| " " == e}
    end
  end

end
