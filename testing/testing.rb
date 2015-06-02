
require 'require_all'
require_all 'game'

# test 1, create board, set up pieces, display board
# move piece from [2, 1] to [3, 0]
# move piece from [5, 2] to [4, 1]
game = Game.new
game.game_board.display_board
piece = game.game_board.get_piece_at([0, 1])
# p piece.board

# p piece.board.dupe_current_board


10.times do
  game.take_turn(:R)
  game.take_turn(:W)
end

# piece1 = game.board[2][1]
# piece2 = game.board[5][2]
# p piece1
# p piece2
# piece1.perform_slide(:L)
# piece2.perform_slide(:L)
# game.display_board
# piece2.perform_slide(:R)
# piece1.perform_slide(:R)
# game.display_board
# piece1.perform_slide(:L)

# input = "A"
# while input != " "
#  input = CheckersInput.read_char
# end

# piece1.perform_jump
# p piece1
# game.display_board
