require 'colorize'

class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves #array of places piece can move
  end

  def valid_moves
  end

  def symbol
  end
end

module SlidingPiece
  HORIZONTAL_DIRS = [[-1, 0], [0, -1], [0, 1], [1,0]]
  DIAGONAL_DIRS = [[1, 1], [-1, 1], [1, -1], [1, -1]]
  [5,5] + [0, -1]
  def moves
    moves = []

    move_dirs.each do |dir|
      puts dir
      moves << grow_unblocked_moves_in_dir([0], dir[1])
    end

    # if move_dirs == "Horizontal"
    #   until grow_unblocked_move_in_dir(@pos[0], @pos[1])
    #     right = [@pos]
    #     right << right[-1][0][1] + HORIZONTAL[2][1]
    #   end
    #
    #   until grow_unblocked_move_in_dir(@pos[0], @pos[1])
    #     left << @pos[]
    #   end
    #
    #   end
    #   end
    #   end
    # end
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  private
  def move_dirs # moves will use this
    raise NotImplemented
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end
end

module SteppingPiece
  def moves
  end

  def move_dirs
  end
end

class Rook < Piece
  include SlidingPiece
  def symbold
    puts "b "
  end

  def move_dirs
    horizontal_dirs
  end
end
