
require 'require_all'
require_all 'game'

game = Game.new
game.game_board.display_board
piece = game.game_board.get_piece_at([0, 1])

10.times do
  game.take_turn(:R)
  game.take_turn(:W)
end

# Finish writing gameplay
# Redo user input
# more screenshots
