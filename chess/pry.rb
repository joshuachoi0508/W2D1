load 'piece.rb'
knight = Knight.new("red", Board.new, [4, 0])
knight.board.grid[4][0] = knight
