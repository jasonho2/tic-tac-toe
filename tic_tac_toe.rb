# Class for the Tic Tac Toe game
class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @current_player = 'X'
  end

  private

  def display_board
    puts "Current board:"
    @board.each do |row|
      puts row.join(' | ')
      puts '-' * 9
    end
  end

end

# Start the game
game = TicTacToe.new