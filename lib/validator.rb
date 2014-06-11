class InputValidator

  def valid_hash?(input)
    input.each_value {|user_input| return false if user_input.length != 1}
    true
  end

  def valid_move?(position)
    return false if position == ""
    (0..8).to_a.to_s.include?(position)
  end

end