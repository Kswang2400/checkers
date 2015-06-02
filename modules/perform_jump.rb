
module PerformJump

  def perform_jump(new_position)
    old_position = @position
    middle_position = [
                        (new_position[0] + old_position[0]) / 2, 
                        (new_position[1] + old_position[1]) / 2
                      ]

    if valid_jump?(middle_position, new_position)
      @position = new_position
      p "pos = #{position}, middle = #{middle_position}, new = #{new_position}"
      @board.set_piece_at(middle_position, nil)
      update_piece_position_on_board(old_position, @position)
    else
      print "\nInvalid move from PERFORM JUMP\n\n"
      # raise InvalidMoveError.new("")
      return false
    end

    true
  end

  def valid_jump?(middle_position, new_position)
    return true if  @board.get_piece_at(new_position).nil? &&
                    !(@board.get_piece_at(middle_position).nil?)
  end

  def check_valid_jump?(new_position)
    duped_piece = dupe_piece
    duped_piece.perform_jump(new_position)
  end

end

