require 'colorize'
require 'singleton'
require_relative 'board'
require 'byebug'

class Piece
  attr_accessor :board, :pos, :color

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
    until board.invalid_pos?(new_pos, @color)
      unblocked_moves << new_pos
      new_pos = [new_pos[0] + dx, new_pos[1] + dy]
    end
    unblocked_moves
  end
end

class Rook < Piece
  include SlidingPiece

  def move_dirs
    horizontal_dirs
  end

  def symbold
    "r"
  end
end

class Bishop < Piece
  include SlidingPiece

  def move_dirs
    diagonal_dirs
  end

  def symbol
    "b"
  end
end

class Queen < Piece
  include SlidingPiece

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

  def symbol
    "q"
  end
end

module SteppingPiece
  def moves
    moves = []

    move_diffs.each do |dir|
      diff_row, diff_col = dir[0], dir[1]
      pos_row, pos_col = @pos[0], @pos[1]
      new_pos = [diff_row + pos_row, diff_col + pos_col]
      moves << new_pos unless board.invalid_pos?(new_pos, @color)
    end
    moves
  end

  def move_diffs
    raise NotImplemented
  end
end

class Knight < Piece
  include SteppingPiece

  def symbol
    "n"
  end

  def move_diffs
    [[2, 1], [2, -1],
    [-2, 1], [-2, -1],
    [1, 2], [-1, 2],
    [1, -2], [-1, -2]]
  end
end

class King < Piece
  include SteppingPiece

  def symbol
    "k"
  end

  def move_diffs
    [[1, 0], [1, 1],
    [1, -1], [-1, 0],
    [-1, -1], [-1, 1],
    [0, -1], [0, 1]]
  end
end

class Pawn < Piece
  def symbold
    "p"
  end

  def move_dirs
    [1, 0]
  end

  def at_start_row?
    if self.pos[0] == 1 || self.pos[0] == 6
      return true
    end
    false
  end

  def forward_dir #return 1 or -1
  end

  def side_attacks
  end
end

class NullPiece < Piece
  include Singleton
  attr_reader :color, :symbol

  def initialize
    @color = :grey
    @symbol = "n"
  end
end
