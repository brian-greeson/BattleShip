
class Game

  attr_reader :game_state

  def initialize(game_state = :main_menu)
    @game_state = game_state
  end

  def main_menu(user_input = nil)
    puts "Welcome to BATTLESHIP./nEnter p to play. Enter q to quit."
    user_input = gets.chomp if !user_input
    @game_state = :quit if user_input.downcase == "q" 
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
