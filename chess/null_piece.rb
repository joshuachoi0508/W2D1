require 'Singleton'

module NullPiece < Piece
  include Singleton

  def initialize("black", pos)
    super("black", board, pos)
  end

  def moves
  end

  def symbol
    print "n "
  end
end
