class InputValidator

  def valid_hash?(players_hash)
    return false if players_hash[:player1][:symbol] == players_hash[:player2][:symbol]
    players_hash.each_value {|user_input| return false if user_input[:symbol].length != 1}
    true
  end

  def valid_move?(board, position)
    return false if position.class == String || board[position - 1] != nil
    (1..9).to_a.include?(position)
  end
end
