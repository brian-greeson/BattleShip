class ComputerPlayer
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def random_empty_cell(cells = @board.cells)
    cells.select! {|coord,cell| !cell.ship}
    cells.keys.sample
  end

  def cells_to_place_ship(ship)
    cells_for_ship = []
    all_coords_valid = false
    until all_coords_valid
      cell = random_empty_cell
      cell_column = cell.delete("A-Z").to_i
      cell_row = cell.delete("0-9")
      if choose_direction == :horizontal
        ship.length.times do |column_offset|
          cells_for_ship << "#{cell_row}#{cell_column + column_offset}"
        end
      else
        ship.length.times do |row_offset|
          cells_for_ship << "#{(cell_row.ord + row_offset).chr}#{cell_column}"
        end
      end
      if cells_for_ship.all? {|cell_choice| @board.cells.keys.include?(cell_choice)}
        all_coords_valid = true
      else
        cells_for_ship = []
      end
    end
    cells_for_ship
  end



  def choose_direction
    [:vertical, :horizontal].sample
  end

  def place_all_ships(ships)
    ships.each do |ship|
       place_one_ship(ship)
    end
  end

  def place_one_ship(ship)
    cells_to_place_ship(ship).each do |cell|

      @board.cells[cell].place_ship(ship)
    end
  end


end

# getting random cell
# using random cell as root for rest of cells up to lenght of ship
