
module PerformJump

  def perform_jump(direction)
    deltas = (@color == :R) ? [[2, -2], [2, 2]] : [[-2, -2], [-2, 2]]
    move = (direction == :L) ? deltas[0] : deltas[1]

    old_position = @position
    new_position = [@position[0] + move[0], @position[1] + move[1]]
    middle_position = [
                        (new_position[0] + old_position[0]) / 2, 
                        (new_position[1] + old_position[1]) / 2
                      ]

    if valid_jump_to?(middle_position, new_position)
      @position = new_position
      @board.set_piece_at(middle_position, nil)
      update_piece_position_on_board(old_position, @position)
    else
      print "\nInvalid move from PERFORM JUMP\n\n"
      # raise InvalidMoveError.new("")
      return false
    end

    self.jumping = true
    
    true
  end

  def valid_jump_to?(middle_position, new_position)
    return true if  @board.get_piece_at(new_position).nil? &&
                    !(@board.get_piece_at(middle_position).nil?)
  end

  def check_valid_jump?(direction)
    duped_piece = dupe_piece
    duped_piece.perform_jump(direction)
  end

  def stop_jumping
    unless check_valid_jump?(:R) || check_valid_jump?(:L)
      self.jumping = false
    end
  end

end

