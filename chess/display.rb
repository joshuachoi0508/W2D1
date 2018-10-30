require_relative 'board'
require_relative 'cursor'
require 'colorize'
require 'colorized_string'
require 'byebug'

class Display
  attr_reader :board, :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    puts "  0  1  2  3  4  5  6  7"
    @board.grid.each_with_index do |row, idx|
      print "#{idx} "
      row.each_with_index do |col, idx2|
        if idx == @cursor.cursor_pos[0] && idx2 == @cursor.cursor_pos[1]
          print "c ".colorize(:red)
        else
          print "   "
        end
      end
      puts
    end
  end
end

if __FILE__ == $PROGRAM_NAME

  d = Display.new(Board.new)
  d.render

  while true
    d.cursor.get_input
    d.render
  end

end
