require_relative 'board'
require_relative 'cursor'
require 'colorize'
require 'colorized_string'

class Display
  def initiazlie(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    puts "  0  1  2  3  4  5  6  7"
    board.grid.each_with_index do |row, idx|
      print "#{idx}"
      place.each do |col|
        print "#{piece.color} "
        print "#{@cursor} ".colorize(:red)
        puts
      end
    end
  end
end
