class Game

  attr_reader :game_state, :ships, :computer_board, :players

  def initialize(game_state = :main_menu)
    @game_state = game_state
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @ships = [cruiser, submarine]
    @players = {computer_player: ComputerPlayer.new,
                player1: HumanPlayer.new(@ships)}
  end

  def main_menu
    puts "Welcome to BATTLESHIP.\nEnter p to play. Enter q to quit."
    user_input = Kernel.gets.chomp.downcase

    # @game_state = :main_menu if user_input != "q" || user_input != "p"
    @game_state = :quit if user_input == "q"
    @game_state = :setup if user_input == "p"
  end

  def clear_screen
    puts `clear`
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @players[:computer_player].board.render
    puts "==============PLAYER BOARD=============="
    puts @players[:player1].board.render(true)
  end



  def player_fire
    @players[:player1].pick_cell_to_fire_on(@players[:computer_player].board)
  end
  #
  # def computer_fire
  #
  # end
  #
  # def display_results
  #
  # end



  def start_game
    while @game_state != :quit
      #-----
      case @game_state
        when :main_menu
          main_menu
          clear_screen

        when :setup
          @players[:computer_player].place_all_ships(@ships)
          @players[:player1].place_ships
          @game_state = :turn
          clear_screen
          require "pry"; binding.pry

        when :turn
          clear_screen
          display_boards
          player_fire
          computer_fire
          display_results

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
