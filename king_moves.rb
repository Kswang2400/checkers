
module KingMoves

  def king_valid_slide_to?(new_position)
    possible_slides = [
                        [@position[0] - 1, @position[1] + 1],
                        [@position[0] - 1, @position[1] - 1],
                        [@position[0] + 1, @position[1] + 1],
                        [@position[0] + 1, @position[1] - 1]
                      ]
    return true if  @board.get_piece_at(new_position).nil? && 
                    possible_slides.include?(new_position)
  end

  def king_valid_jump?(new_position)
    return true if  @board.get_piece_at(new_position).nil? &&
                    !(@board.get_piece_at(middle_position).nil?)
  end

end