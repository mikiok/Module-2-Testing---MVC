require "./Board"
require "./Cell"

class Game
	attr_reader :board
	def initialize grid
		@board = grid
	end

	def play
		@board.print_grid
		while(!@board.empty_grid?) do
			@board.regenerate
			@board.transform_grid @board.get_states
			sleep(0.5)
			system "clear"
			@board.print_grid
		end
	end
end

board = Board.new "saved_board.txt"
game = Game.new board
game.play
