require 'colorize'
require 'Singleton'
require_relative 'board'
require 'byebug'

class Piece
  attr_accessor :board, :pos

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
  # [5,5] + [0, -1]
  def moves
    moves = []

    move_dirs.each do |dir|
      moves << grow_unblocked_moves_in_dir(dir[0], dir[1])
    end
    moves
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  # private
  def move_dirs #when move_dirs is not written
    raise NotImplemented
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    unblocked_moves = []
    new_pos = [@pos.dup[0] + dx, @pos.dup[1] + dy]
    until board.invalid_pos?(new_pos)
      unblocked_moves << new_pos
      new_pos = [new_pos[0] + dx, new_pos[1] + dy]
    end
    unblocked_moves
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
  def move_dirs
    horizontal_dirs
  end

  def symbold
    puts "r "
  end
end

class Bishop < Piece
  include SlidingPiece
  def move_dirs
    diagonal_dirs
  end

  def symbol
    puts "b "
  end
end

class Queen < Piece
  include SlidingPiece
  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

  def symbol
    puts "q "
  end
end

# class NullPiece < Piece
#   include Singleton
#
#   def initialize
#   end
#
#   def moves
#   end
#
#   def symbol
#     print "n "
#   end
# end
