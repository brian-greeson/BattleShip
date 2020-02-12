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
    selected_cells = []
    all_coords_valid = false
    until all_coords_valid
      selected_cells = consecutive_cells(random_empty_cell, random_direction, ship.length)
      if selected_cells.all? {|coord| @board.cells.keys.include?(coord)}
        all_coords_valid = true
      else
        selected_cells = []
      end
    end
    selected_cells
  end

  def consecutive_cells(cell, direction, ship_length)
    coord = split_cell_coordinate(cell)
    cells_for_ship = []
    if direction == :horizontal
      ship_length.times do |column_offset|
        cells_for_ship << "#{coord[:row]}#{coord[:column] + column_offset}"
      end
    else
      ship_length.times do |row_offset|
        cells_for_ship << "#{(coord[:row].ord + row_offset).chr}#{coord[:column]}"
      end
    end
    cells_for_ship
  end

  def split_cell_coordinate(cell)
    coordinate = {}
    coordinate[:column] = cell.delete("A-Z").to_i
    coordinate[:row] = cell.delete("0-9")
    coordinate
  end

  def random_direction
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
