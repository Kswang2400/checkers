
module PerformSlide

  def perform_slide(new_position)
    old_position = @position

    if @king
      if king_valid_slide_to?(new_position)
        @position = new_position
        update_piece_position_on_board(old_position, @position)
      else
        print "\nInvalid move from PERFORM SLIDE\n\n"
        # raise InvalidMoveError.new("")
        return false
      end
    elsif valid_slide_to?(new_position)
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
    possible_slides = (color == :W) ? [
                        [@position[0] - 1, @position[1] + 1],
                        [@position[0] - 1, @position[1] - 1]
                      ]             : [
                        [@position[0] + 1, @position[1] + 1],
                        [@position[0] + 1, @position[1] - 1]
                      ]
    return true if  @board.get_piece_at(new_position).nil? && 
                    possible_slides.include?(new_position)
  end

  def check_valid_slide?(new_position)
    duped_piece = dupe_piece
    duped_piece.perform_slide(new_position)
  end

end

