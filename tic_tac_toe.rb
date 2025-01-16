# Class for the Tic Tac Toe game
class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @current_player = 'X'
  end

  def play
    display_board
    until game_over?
      player_turn
      display_board
      break if winner
      switch_player
    end
    display_board
    announce_result
  end

  private

  def display_board
    puts "Current board:"
    @board.each do |row|
      puts row.join(' | ')
      puts '-' * 9
    end
  end

  def player_turn
    puts "Player #{@current_player}, enter your move (row and column: 1 1 for middle):"
    row, col = gets.chomp.split.map(&:to_i)

    if valid_move?(row, col)
      @board[row][col] = @current_player
    else
      puts "Invalid move! Try again."
      player_turn
    end
  end

  def valid_move?(row, col)
    row.between?(0, 2) && col.between?(0, 2) && @board[row][col] == ' '
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def game_over?
    winner || draw?
  end

  def winner
    lines = rows + columns + diagonals
    lines.each do |line|
      return @current_player if line.uniq.size == 1 && line.first != ' '
    end
    nil
  end

  def draw?
    @board.flatten.none? { |cell| cell == ' ' }
  end

  def rows
    @board
  end

  def columns
    @board.transpose
  end

  def diagonals
    [[@board[0][0], @board[1][1], @board[2][2]], [@board[0][2], @board[1][1], @board[2][0]]]
  end

  def announce_result
    if winner
      puts "Player #{winner} wins!"
    else
      puts "It's a draw!"
    end
  end

end

# Start the game
game = TicTacToe.new
game.play