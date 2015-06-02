
require 'require_all'
require_relative 'error'
# require_relative 'perform_slide'
# require_relative 'perform_jump'
# require_relative 'king_moves'
require_all './modules'

class Piece
  include PerformSlide
  include PerformJump
  include KingMoves

  attr_accessor :position, :board, :king
  attr_reader :color

  def initialize(board, color, position, king = false)
    @board = board
    @color = color
    @position = position
    @king = king
  end

  def display
    if @king
      print " ♚ ".red   if @color == :R
      print " ♚ ".white if @color == :W
    else
      print " ⛀ ".red   if @color == :R
      print " ⛀ ".white if @color == :W
    end
  end

  def inspect
    "Piece at #{position}, color = #{color}, king? #{king}"
  end

  def dupe_piece
    Piece.new(@board.dupe_current_board, @color, @position, @king)
  end

  def perform_move(new_position)
    if check_valid_slide?(new_position)
      perform_slide(new_position)
    elsif check_valid_jump?(new_position)
      perform_jump(new_position)
    else
      # print "\nInvalid move from PERFORM MOVE\n\n"
      # raise InvalidMoveError.new("Invalid move from PERFORM MOVE")
      return false
    end
  end

  def update_piece_position_on_board(old_pos, new_pos)
    piece = @board.board[old_pos[0]][old_pos[1]]
    @board.board[old_pos[0]][old_pos[1]] = nil
    @board.board[new_pos[0]][new_pos[1]] = piece

    promote if (new_pos[0] == 7) && color == :R || (new_pos[0] == 0) && color == :W
  end

  def flip(direction)
    (direction == :R) ? :l : :R
  end

  def promote
    self.king = true
  end
end
