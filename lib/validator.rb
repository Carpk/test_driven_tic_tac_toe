class InputValidator

  def valid_hash?(input)
    return false if input[:player1_symbol] == input[:player2_symbol]
    input.each_value {|user_input| return false if user_input.length != 1}
    true
  end

  def valid_move?(position)
    return false if position == ""
    (1..9).to_a.to_s.include?(position)
  end

end
