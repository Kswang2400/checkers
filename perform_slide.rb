
module PerformSlide

  def perform_slide(direction)
    deltas = (@color == :R) ? [[1, -1], [1, 1]] : [[-1, -1], [-1, 1]]
    move = (direction == :L) ? deltas[0] : deltas[1]
    
    old_position = @position
    new_position = [@position[0] + move[0], @position[1] + move[1]]

    if valid_slide_to?(new_position)
      @position = new_position
      update_piece_position_on_board(old_position, @position)
    else
      print "\nInvalid move from PERFORM SLIDE\n\n"
      # raise InvalidMoveError.new("")
      return false
    end

    true
  end

  def valid_slide_to?(new_position)
    return true if @board.get_piece_at(new_position).nil?
  end

  def check_valid_slide?(direction)
    duped_piece = dupe_piece
    duped_piece.perform_slide(direction)
  end

end

