class TicTacToeManager

  def initialize
    @view = DisplayUtility.new
    @validator = InputValidator.new
    # @view.welcome
  end

  def start
    new_players = valid_players_hash
    @game = GamePlay.new(new_players)
    play
  end

  def play
    until @game.gameover?
      board = @game.display_board
      @view.display_board(board)
      position = valid_player_move
      @game.player_move_to(position.to_i)
    end
    @view.display_board(@game.display_board)
    @view.gameover_notice
  end

  def valid_players_hash
    players_hash = prompt_for_players
    until @validator.valid_hash?(players_hash)
      @view.invalid_input_error
      players_hash = prompt_for_players
    end
    players_hash
  end

  def prompt_for_players
    player1 = @view.create_player_prompt("player1")
    player2 = @view.create_player_prompt("player2")
    {player1_symbol: player1, player2_symbol: player2}
  end

  def valid_player_move
    new_position = @view.prompt_player_move
    until @validator.valid_move?(new_position)
      @view.invalid_input_error
      new_position = @view.prompt_player_move
    end
    new_position
  end

end