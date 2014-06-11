class DisplayUtility

  def welcome
    puts "Welcome to Tic Tac Toe, press enter to begin."
  end

  def create_player_prompt(player)
    puts "Please enter your game piece symbol for #{player}:"
    gets.chomp
  end

  def prompt_player_move
    puts "Please enter your position on the keypad:"
    gets.chomp
  end

  def gameover_notice
    puts "Game Over!"
  end

  def invalid_input_error
    puts "There was an invalid option, please try again"
  end

  def display_board(board)
    print <<-EOS
     #{board[0]} | #{board[1]} | #{board[2]}
    ---|---|---
     #{board[3]} | #{board[4]} | #{board[5]}
    ---|---|---
     #{board[6]} | #{board[7]} | #{board[8]}
    EOS
  end
end