require_relative 'piece'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    set_up
  end

  def set_up
    @grid.each_with_index do |row, idx|
      row.each_with_index do |col, idx2|
        if idx == 0 || idx == 1 || idx == 6 || idx == 7
          @grid[idx][idx2] = Piece.new("red", self, [idx, idx2])
        else
          @grid[idx][idx2] = nil
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    if start_pos == nil
      raise "There is no piece at #{start_pos}"
    elsif self[end_pos] != nil || self[end_pos] == nil
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
    self[pos] == nil
  end

  def invalid_pos?(pos)
    if self.grid[pos[0]][pos[1]] != nil || pos[0] > 7 || pos[1] > 7 
      return true
    end
    false
  end
end
