class Game

  attr_reader :game_state, :ships, :computer_board

  def initialize(game_state = :main_menu)
    @game_state = game_state
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @ships = [cruiser, submarine]
    @players = {computer_player: ComputerPlayer.new,
                player1: HumanPlayer.new(@ships)}
  end

  def main_menu(user_input = nil)
    puts "Welcome to BATTLESHIP.\nEnter p to play. Enter q to quit."
    user_input = gets.chomp.downcase if !user_input

    # @game_state = :main_menu if user_input != "q" || user_input != "p"
    @game_state = :quit if user_input == "q"
    @game_state = :setup if user_input == "p"
  end

  def clear_screen
    puts `clear`
  end

  def start_game
    while @game_state != :quit
      #-----
      case @game_state
        when :main_menu
          main_menu
          clear_screen
        when :setup
          require "pry"; binding.pry


        when :turn

        else
          puts "WTF?!?!"
      end
      #-----
    end

  end

end
    # default state of main menu
    # if state == main menu
    #   display main menu
    #
    # if state == setup
    #   computer place it's ships
    #   human place it's ships
    #
    # if state == turns
    #   computer fires
    #   human fires
    #
    # if state == endgame
    #   dipslay summary
    #   ask to play agian





# --main menu phase
# testing user can quit main menu
# test user can play from main menu
#
#
# ---setup phase
# computer places ships
 # -get_random corrdinet for each ship
 # -
#
# player places ships
#
# ---Turns phase
#
# ---Summary phase
