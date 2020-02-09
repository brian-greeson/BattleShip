class Game

  attr_reader :game_state, :board, :ships

  def initialize(game_state = :main_menu)
    @game_state = game_state
    @board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @ships = {cruiser: cruiser, submarine: submarine}
  end

  def main_menu(user_input = nil)
    puts "Welcome to BATTLESHIP./nEnter p to play. Enter q to quit."
    user_input = gets.chomp.downcase if !user_input

    @game_state = :main_menu if user_input != "q" || user_input != "p"
    @game_state = :quit if user_input == "q"
    @game_state = :play if user_input == "p"
  end

end


# --main menu phase
# testing user can quit main menu
# test user can play from main menu
#
#
# ---setup phase
# computer places ships
#
# player places ships
#
# ---Turns phase
#
# ---Summary phase
