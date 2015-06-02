
require "colorize"

require_relative 'input'
require_relative 'piece'

class Board
  attr_reader :board
  attr_writer :selected

  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def display_board
    system("clear")
    print "\n\n\n"
    print "       " + "    0  1  2  3  4  5  6  7   ".white.on_blue + "\n"
    @board.each_with_index do |row, i|
      print "       " + " #{i} ".on_blue
      row.each_with_index do |space, j|
        if space.nil?
          print "   ".on_red if (i + j) % 2 == 0
          print "   ".on_black if (i + j) % 2 == 1
        else
          piece = @board[i][j]
          piece.display
        end
      end
      print "  ".on_blue + "\n"
    end
    print "       " + "                             ".on_blue + "\n"
  end

  def set_up_game_pieces
    @board.each_with_index do |row, i|
      row.each_with_index do |space, j|
        if (i + j) % 2 == 1 && i <= 2
          @board[i][j] = Piece.new(self, :R, [i, j])
        end

        if (i + j) % 2 == 1 && i >= 5
          @board[i][j] = Piece.new(self, :W, [i, j])
        end
      end
    end
  end

  def get_piece_at(position)
    @board[position[0]][position[1]]
  end

  def set_piece_at(position, piece)
    @board[position[0]][position[1]] = piece
  end

  def dupe_current_board
    duped_board = Board.new
    pieces = @board.flatten.compact
    pieces.each do |piece|
      pos = piece.position
      duped_board.board[pos[0]][pos[1]] = piece
    end

    duped_board
  end
end


