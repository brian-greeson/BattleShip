class Game

  attr_reader :game_state, :ships, :computer_board

  def initialize(game_state = :main_menu)
    @game_state = game_state
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @ships = {cruiser: cruiser, submarine: submarine}
    @computer_board = Board.new
  end

  def main_menu(user_input = nil)
    puts "Welcome to BATTLESHIP./nEnter p to play. Enter q to quit."
    user_input = gets.chomp.downcase if !user_input

    @game_state = :main_menu if user_input != "q" || user_input != "p"
    @game_state = :quit if user_input == "q"
    @game_state = :play if user_input == "p"
  end

  def random_cell
    @computer_board.cells.keys.sample
  end

  def cells_for_computer_ship(ship)
    cell = random_cell
    cells_for_ship =[]
    cell_column = cell.delete("A-Z").to_i
    cell_row = cell.delete("0-9")
    direction = [:vertical, :horizontal].sample

    if direction == :horizontal
      ship.length.times do |column_offset|
        cells_for_ship << "#{cell_row}#{cell_column + column_offset}"
      end
    else
      ship.length.times do |row_offset|
        cells_for_ship << "#{(cell_row.ord + row_offset).chr}#{cell_column}"
      end
    end
    cells_for_ship
  end

  def place_computer_ships
     @ships.each do |ship|
       coordinates_to place
     end
  end

  def start_game

  end


end


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
