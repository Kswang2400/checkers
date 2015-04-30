
require_relative 'board'

class Game 
  attr_reader :game_board

  def initialize
    @game_board = Board.new
    @game_board.set_up_game_pieces
    @player_turn = :R
  end

  def gets_input(player_turn)
    print "\n\n\n"
    color = (player_turn == :R) ? "Red's" : "White's"
    puts "It is #{color} turn\n\n" 
    puts "Which piece do you want to move? "
    position = gets.chomp.split(",").map { |value| value.to_i }
    piece = @game_board.get_piece_at(position)
    puts "\n\nWhich way do you want to move? (l)eft or (r)ight"
    direction = gets.chomp.upcase.to_sym

    [piece, direction]
  end

  def take_turn(player_turn)
    input = gets_input(player_turn)
    if input[0].nil?
      print "\nNo piece there\n\n"
      # raise InvalidMoveError.new("")
    else
      input[0].perform_move(input[1])
      game_board.display_board
    end

    if input[0].jumping
      take_turn(player_turn)

      # FIND A WAY TO STOP THEIR TURN WHEN NO MORE VALID JUMPS
    end
  end

end








  # def play
  #   input = CheckersInput.read_char
  #   selected = [0, 0]

  #   until input == " "
  #     case input
  #     when "\e[A"
  #       selected = [[selected[0] - 1, 0].max, selected[1]]
  #     when "\e[D"
  #       selected = [selected[0], [selected[1] - 1, 0].max]
  #     when "\e[B"
  #       selected = [[selected[0] + 1, 2].min, selected[1]]
  #     when "\e[C"
  #       selected = [selected[0], [selected[1] + 1, 1].min]
  #     when "\e"
  #       exit
  #     when " "
  #       puts "SPACE!"
  #     end
  #   end
  # end

