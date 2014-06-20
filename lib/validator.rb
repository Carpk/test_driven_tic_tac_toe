class InputValidator

  def valid_hash?(input)
    return false if input[:player1_symbol] == input[:player2_symbol]
    input.each_value {|user_input| return false if user_input.length != 1}
    true
  end

  def valid_move?(board, position)
    return false if position.class == String || board[position - 1] != nil
    (1..9).to_a.include?(position)
  end
end
