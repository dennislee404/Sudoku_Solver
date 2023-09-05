class Sudoku
	attr_reader
	def initialize(grid)
		@grid = grid
	end

	def display_grid
		#display the grid in 9x9 format
	end

	def solve
		#solve sudoku by iterating each row then column
		#check if a number exists in the row/column/grid
		#filter until there's only one number left
		#fill in the number 
	end
end