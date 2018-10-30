require_relative 'piece'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def move_piece(start_pos, end_pos)
    if start_pos == NullPiece
      raise "There is no piece at #{start_pos}"
    elsif self[end_pos] != NullPiece || self[end_pos] == nil
      raise "You can't move your piece to #{end_pos}"
    else
      self[end_pos] = self[start_pos]
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def valid_pos?(pos)
    self[pos] == NullPiece
  end
end
