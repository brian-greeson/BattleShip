require "pry"
class Board
  attr_reader :cells
  def initialize()
    @cells = {}
    cell_names = create_list_of_cells
    cell_names.each do |cell_coordinate|
      @cells[cell_coordinate] = Cell.new(cell_coordinate)

    end

  end

  def create_list_of_cells
    cells_to_make = []
    ('A'..'D').each do |letter|
      (1..4).each do |number|
        cells_to_make << "#{letter}#{number}"
      end
    end
    cells_to_make
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    return false if coordinates.length != ship.length
    valid = true
    coordinates_empty = coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
    valid = coordinates_empty

    coordinates.drop(1).each_with_index do |coordinate, index| #found out about .drop() Yay!
      this_coord = coordinate.delete('0-9').sum + coordinate.delete('A-Z').to_i
      last_coord = coordinates[index].delete('0-9').sum + coordinates[index].delete('A-Z').to_i
      valid = false if this_coord != 1 + last_coord #simple hash values
    end
    valid
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def render

  end



end
