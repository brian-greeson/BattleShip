require './lib/computer_player'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/human_player'
require './lib/game'

battleship_game = Game.new
battleship_game.clear_screen
battleship_game.start_game
puts "Thanks for playing!"
