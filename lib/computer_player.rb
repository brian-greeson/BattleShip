class ComputerPlayer
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def random_empty_cell(cells = @board.cells) #<---- ask why is this setting them to same obj?
    empty_cells = cells.reject {|coord,cell| cell.ship}
    empty_cells.keys.sample
  end

  def cells_to_place_ship(ship)
    selected_cells = []
    all_coords_valid = false
    until all_coords_valid
      selected_cells = consecutive_cells(random_empty_cell, random_direction, ship.length)
      if selected_cells.all? {|cell| @board.cells.keys.include?(cell)}
        all_coords_valid = true
      else
        selected_cells = []
      end
    end

    selected_cells
  end

  def consecutive_cells(cell, direction, ship_length)
    coord = split_cell_coordinate(cell)
    cells = []
    if direction == :horizontal
      ship_length.times do |column_offset|
        cells << "#{coord[:row]}#{coord[:column] + column_offset}"
      end
    else
      ship_length.times do |row_offset|
        cells << "#{(coord[:row].ord + row_offset).chr}#{coord[:column]}"
      end
    end
    cells
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
    cells = cells_to_place_ship(ship)
    @board.place(ship, cells)
  end


end

# getting random cell
# using random cell as root for rest of cells up to lenght of ship
