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
    if @cells.keys.include?(coordinate)
      true
    else
      false
    end
  end

  def valid_placement?(ship, coordinates)
    return false if coordinates.length != ship.length
    valid = true
    coordinates.drop(1).each_with_index do |coordinate, index| #found out about .drop() Yay!
      valid = false if coordinate.sum != 1 + coordinates[index].sum #Can't check total checksum because they have to be sequential (assending order)
    end

    valid
  end


end
