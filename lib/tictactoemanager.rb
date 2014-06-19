class TicTacToeManager

  def initialize
    @view = DisplayUtility.new
    @validator = InputValidator.new
    @game = GamePlay.new
  end

  def start
    @view.welcome
    new_players = valid_players_hash
    @game.create_players(new_players)
    play
  end

  def valid_players_hash
    players_hash = create_players_hash
    until @validator.valid_hash?(players_hash)
      @view.invalid_input_error
      players_hash = create_players_hash
    end
    players_hash
  end

  def create_players_hash
    player1 = @view.create_player_prompt("player1")
    player2 = @view.create_player_prompt("player2")
    {player1_symbol: player1, player2_symbol: player2}
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

  def valid_player_move
    player = @game.current_player[:player].game_piece
    new_position = @view.prompt_player_move(player)
    until @validator.valid_move?(new_position)
      @view.invalid_input_error
      new_position = @view.prompt_player_move(player)
    end
    new_position
  end

end
