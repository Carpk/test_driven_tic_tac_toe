class BoardValues

  def self.gameover?(board)
    board.board_full? ||
    self.board_has_winner?(board)
  end

  def self.tie_game?(board)
    board.board_full? && self.board_has_winner?(board) == false
  end

  def self.board_has_winner?(board)
    value = false
    board.possible_wins.each do |section|
      value = true if self.group_match?(section)
    end
    value
  end

  def self.winner_of(board)
    board.possible_wins.each do |section|
      return section.first if self.group_match?(section)
    end
  end

  def self.group_match?(section)
    section.rotate == section.delete_if {|e| " " == e}
  end
end
