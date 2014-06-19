class DisplayUtility

  def create_player_prompt(player)
    puts "Please enter your game piece symbol for #{player}:"
    gets.chomp
  end

  def prompt_player_move(player_token)
    puts "Please enter your position on the keypad for player #{player_token}:"
    gets.chomp
  end

  def gameover_notice
    puts "Game Over!"
  end

  def invalid_input_error
    puts "That was an invalid option, please try again"
  end

  def display_board(new_board)
    board = new_board.dup
    board.each_with_index{|e,i| board[i] = " " if e == nil}
    clear_screen
    print <<-EOS
     #{board[0]} | #{board[1]} | #{board[2]}
    ---|---|---
     #{board[3]} | #{board[4]} | #{board[5]}
    ---|---|---
     #{board[6]} | #{board[7]} | #{board[8]}
    EOS
  end

  def welcome
    clear_screen
    print <<-EOS
  Welcome to Tic Tac Toe.
  Enter 1-9 to make your placement on the grid, such as below:

       1 | 2 | 3
      ---|---|---
       4 | 5 | 6
      ---|---|---
       7 | 8 | 9

    EOS
  end

  def clear_screen
    print "\e[2J"
    print "\e[H"
  end
end
