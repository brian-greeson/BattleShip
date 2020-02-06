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
    (1..ship.length - 1).each do |num|
      valid = false if coordinates[num].sum != 1 + coordinates[num - 1].sum
    end
    valid
  end


end
