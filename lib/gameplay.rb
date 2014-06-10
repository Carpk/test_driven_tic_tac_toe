class GamePlay

  def initialize(params)
    @board = TicTacToeBoard.new
    @players = create_players_hash(params)
    @current_player = @players[:p1]
  end

  def gameover?
    return true unless @board.unassigned_positions?
    grid = @board.grid
    winning_combos_positions.each do |set|
      core_set = [grid[set[0]], grid[set[1]], grid[set[2]]]
      next if core_set.include?(nil)
      return true if core_set == core_set.rotate
    end
    false
  end

  def player_move_to(position)
    token = @current_player[:player].game_piece
    @board.assign_token_to(token, position)
    @current_player = @players[@current_player[:next]]
  end

  def display_board
    @board.present_board
  end

  def winning_rows
    board_divisor = Math.sqrt(@board.grid.length).to_i
    @board.grid.each_slice(board_divisor) do |win_attempt|
      next if win_attempt.include?(nil)
      return true if win_attempt == win_attempt.rotate
    end
    false
  end

  def winning_columns
    board_divisor = Math.sqrt(@board.grid.length).to_i
    board_divisor.times do |index|
      win_attempt = [@board.grid[index], @board.grid[index + board_divisor], @board.grid[index + board_divisor * 2]]
      next if win_attempt.include?(nil)
      return true if win_attempt == win_attempt.rotate
    end
    false
  end

  def winning_diagonals
    board_divisor, index_offset = Math.sqrt(@board.grid.length).to_i, 0
    backslash, forwardslash = [], []
    @board.grid.each_slice(board_divisor) do |win_attempt|
      backslash << win_attempt[0 + index_offset]
      forwardslash << win_attempt[-1 - index_offset]
      index_offset += 1
    end
    return true if backslash.compact == backslash.rotate || forwardslash.compact == forwardslash.rotate
    false
  end

  def winning_combos_positions
    [[0,1,2],[3,4,5],
     [6,7,8],[0,3,6],
     [1,4,7],[2,5,8],
     [0,4,8],[2,4,6]]
  end

  def create_players_hash(params)
    player1 = Player.new(params[:p1_symbol])
    player2 = Player.new(params[:p2_symbol])
    @players = {p1: {next: :p2, player: player1}, p2: {next: :p1, player: player2}}
  end
end