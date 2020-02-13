class Game

  attr_reader :game_state, :ships, :players

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

  def computer_fire
    @players[:computer_player].pick_cell_to_fire_on(@players[:player1].board)
  end

  def display_results(human_targeted_cell, computer_targeted_cell)
    @players[:computer_player].board.cells[human_targeted_cell].fire_upon
    @players[:player1].board.cells[computer_targeted_cell].fire_upon

    puts "Your shot at #{human_targeted_cell} was a #{shot_result(:computer_player, human_targeted_cell)}."
    puts "My shot at #{computer_targeted_cell} was a #{shot_result(:player1, computer_targeted_cell)}."
    #We stopped in this method due to time.
  end

  def shot_result(player, cell)
    render_result = @players[player].board.cells[cell].render
    if render_result == "H" || render_result == "X"
      return "Hit"
    else
      return "Miss"
    end
  end

  def start_game
    while @game_state != :quit
      case @game_state
        when :main_menu
          main_menu
          clear_screen

        when :setup
          @players[:computer_player].place_all_ships(@ships)
          @players[:player1].place_ships
          @game_state = :turn
          clear_screen

        when :turn
          clear_screen
          display_boards
          display_results(player_fire, computer_fire)
          clear_screen

        else
          puts "Invalid Selection"
      end
    end
  end

end
