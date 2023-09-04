string = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'

sudoku_grid =
[
	[ 0 , 1 , 5 , 0 , 0 , 3 , 0 , 0 , 2 ],
	[ 0 , 0 , 0 , 1 , 0 , 0 , 9 , 0 , 6 ],
	[ 2 , 7 , 0 , 0 , 6 , 8 , 4 , 3 , 0 ],
	[ 4 , 9 , 0 , 0 , 0 , 2 , 0 , 1 , 7 ],
	[ 5 , 0 , 1 , 0 , 4 , 0 , 3 , 8 , 0 ],
	[ 0 , 0 , 3 , 9 , 0 , 5 , 0 , 0 , 0 ],
	[ 9 , 0 , 0 , 0 , 8 , 1 , 0 , 4 , 0 ],
	[ 8 , 6 , 0 , 0 , 7 , 0 , 0 , 2 , 5 ],
	[ 0 , 3 , 7 , 2 , 0 , 4 , 6 , 0 , 0 ]
]

def check_row(sudoku_grid,empty_grid,possible_answer,row)
	column = 0
	while column < 9
		if empty_grid.include? sudoku_grid[row][column]

		else
			empty_grid << sudoku_grid[row][column]
			possible_answer.delete(sudoku_grid[row][column])
		end
		column += 1
	end

	return empty_grid, possible_answer	
end

def check_column(sudoku_grid,empty_grid,possible_answer,column)
	row = 0
	while row < 9
		if empty_grid.include? sudoku_grid[row][column]
			
		else
			empty_grid << sudoku_grid[row][column]
			possible_answer.delete(sudoku_grid[row][column])
		end
		row += 1
	end
	return empty_grid, possible_answer	
end

def check_grid(sudoku_grid,empty_grid,possible_answer,row,column)
	x = 0
	while x < 3
		y = 0
		xcolumn = column
		while y < 3
			if empty_grid.include? sudoku_grid[row][xcolumn]

			else
				empty_grid << sudoku_grid[row][xcolumn]
				possible_answer.delete(sudoku_grid[row][xcolumn])
			end
			y += 1
			xcolumn += 1
		end
		x += 1
		row += 1
	end
	# puts "Number exist in grid: #{empty_grid.join}"
	# puts "Possible answer #{possible_answer.join}"
	# puts " "
end

def display_grid(grid)
	puts " "
	grid.each do |row|
		puts row.join(" ")
		# row.each do |column|
		# 	# puts column
		# 	# puts column.class
		#  end
	end	
end

def run(sudoku_grid)
	row = 0
	while row < 9
		column = 0
		while column < 9
			if sudoku_grid[row][column] == 0 
				empty_grid = []
				possible_answer = [1,2,3,4,5,6,7,8,9]
				# puts "[#{row}][#{column}]"
				check_row(sudoku_grid,empty_grid,possible_answer,row)
				check_column(sudoku_grid,empty_grid,possible_answer,column)
				if column < 3
					if row < 3
						check_grid(sudoku_grid,empty_grid,possible_answer,0,0)
					elsif row < 6
						check_grid(sudoku_grid,empty_grid,possible_answer,3,0)
					else
						check_grid(sudoku_grid,empty_grid,possible_answer,6,0)
					end
				elsif column < 6
					if row < 3
						check_grid(sudoku_grid,empty_grid,possible_answer,0,3)
					elsif row < 6
						check_grid(sudoku_grid,empty_grid,possible_answer,3,3)
					else
						check_grid(sudoku_grid,empty_grid,possible_answer,6,3)
					end
				else
					if row < 3
						check_grid(sudoku_grid,empty_grid,possible_answer,0,6)
					elsif row < 6
						check_grid(sudoku_grid,empty_grid,possible_answer,3,6)
					else
						check_grid(sudoku_grid,empty_grid,possible_answer,6,6)
					end
				end

				if possible_answer.length == 1 
					sudoku_grid[row][column] = possible_answer[0]
				end
			end
			column += 1
		end
		row += 1
	end
	return sudoku_grid
end

def main(sudoku_grid)
	run(sudoku_grid)
end

display_grid(sudoku_grid)
new_sudoku_grid = main(sudoku_grid)
new_sudoku_grid2 = main(new_sudoku_grid)
display_grid(new_sudoku_grid2)

	