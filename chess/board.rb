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
          @grid[idx][idx2] = NullPiece.instance
        end
      end
    end

    # @grid[0] = [Rook.new(:black, self, [0, 0]), Kinght.new(:black, self, [0, 1]), Bishop.new(:black, self, [0, 2]),
    #             Queen.new(:black, self, [0, 3]), King.new(:black, self, [0, 4]), Bishop.new(:black, self, [0, 5]),
    #             Kinght.new(:black, self, [0, 6]), Rook.new(:black, self, [0, 7])]
    #
    # @grid[7] = [Rook.new(:grey, self, [0, 0]), Kinght.new(:grey, self, [0, 1]), Bishop.new(:grey, self, [0, 2]),
    #             Queen.new(:grey, self, [0, 3]), King.new(:grey, self, [0, 4]), Bishop.new(:grey, self, [0, 5]),
    #             Kinght.new(:grey, self, [0, 6]), Rook.new(:grey, self, [0, 7])]
  end

  def fill_back_row
    # [1, 7].each_with_index do |row, col|
    #   @grid[row][col] = Rook.new(:black, self, [1, col]) if col == 0
    #   @grid[row][col] = Knight.new(:black, self, [1, col]) if col == 1
    #   @grid[row][col] = Bishop.new(:black, self, [1, col]) if col = 2
    #   @grid[row][col] = Queen.new(:black, self, [1, col]) if col = 3
    #   @grid[row][col] = King.new(:black, self, [1, col]) if col = 4
    #   @grid[row][col] = Bishop.new(:black, self, [1, col]) if col = 5
    #   @grid[row][col] = Knight.new(:black, self, [1, col]) if col = 6
    #   @grid[row][col] = Rook.new(:black, self, [1, col]) if col = 7
    # end
  end

  def move_piece(start_pos, end_pos)
    if start_pos == NullPiece.instance
      raise "There is no piece at #{start_pos}"
    elsif self[end_pos] != NullPiece.instance || self[end_pos] == NullPiece.instance
      raise "You can't move your piece to #{end_pos}"
    else
      self[end_pos] = self[start_pos]
    end
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, value)
    @grid[row][col] = value
  end

  def valid_pos?(pos)
    self[pos] == NullPiece.instance
  end

  def invalid_pos?(pos, color)
    if self.grid[pos[0]][pos[1]] != NullPiece.instance
      return true
    elsif pos[0] > 7 || pos[1] > 7 || pos[0] < 0 || pos[1] < 0
      return true
    end
    false
  end
end
