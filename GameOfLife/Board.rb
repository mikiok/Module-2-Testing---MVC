require "colorize"
require "./Cell"

class Board
	attr_accessor :grid
	GRID_DIMENSION = 10
	def initialize file
		@grid = Array.new(GRID_DIMENSION) { Array.new(GRID_DIMENSION, nil) }
		if !load_grid?(file)
			puts "Board file not found"
		end
	end

	def print_grid
		@grid.each do |row|
			row.each do |item|
				if item.state == 1
					print "#{item.state} ".red
				else
					print "#{item.state} "
				end
			end
			print "\n"
		end
	end

	def load_grid? file
		if File.exist?(file)
			board = IO.read(file).split(" ")
			aux_board = Array.new(GRID_DIMENSION) { Array.new(GRID_DIMENSION, nil) }
			for row in 0..GRID_DIMENSION-1
				for column in 0..GRID_DIMENSION-1
					aux_board[row][column] = board[(row*GRID_DIMENSION)+column].to_i
				end
			end
			transform_grid aux_board
			return true
		else
			return false
		end
	end

	def empty_grid?
		for row in 0..GRID_DIMENSION-1
			for column in 0..GRID_DIMENSION-1
				if @grid[row][column].state != 0
					return false
				end
			end
		end
		return true
	end

	def get_states
		aux_board = Array.new(GRID_DIMENSION) { Array.new(GRID_DIMENSION, nil) }
		for row in 0..GRID_DIMENSION-1
			for column in 0..GRID_DIMENSION-1
				aux_board[row][column] = @grid[row][column].state	
			end
		end
		aux_board
	end

	def transform_grid board
		for row in 0..GRID_DIMENSION-1
			for column in 0..GRID_DIMENSION-1
				@grid[row][column] = Cell.new(board[row][column], get_neighbours(board, row, column))
			end
		end
	end

	def regenerate
		for row in 0..GRID_DIMENSION-1
			for column in 0..GRID_DIMENSION-1
				@grid[row][column].regenerate
			end
		end
	end

	def get_neighbours board, row, column
		neighbours = horizontal_neighbours(board, row, column) + vertical_neighbours(board, row, column) + diagonal_neighbours(board, row, column)
	end

	def horizontal_neighbours board, row, column
		neighbours = [board[row][column-1],
			board[row][(column+1)%GRID_DIMENSION]
		]
	end

	def vertical_neighbours board, row, column
		neighbours = [board[row-1][column],
			board[(row+1)%GRID_DIMENSION][column]
		]
	end

	def diagonal_neighbours board, row, column
		neighbours = [board[row-1][column-1],
			board[(row+1)%GRID_DIMENSION][column-1],
			board[row-1][(column+1)%GRID_DIMENSION],
			board[(row+1)%GRID_DIMENSION][(column+1)%GRID_DIMENSION]
		]
	end
end