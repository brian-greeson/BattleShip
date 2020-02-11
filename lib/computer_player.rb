class ComputerPlayer
  attr_reader :board 
  def initialize
    @board = Board.new
  end

  # def random_cell(cells)
  #   cells.keys.sample
  # end
  #
  # def cells_for_computer_ship(ship)
  #   cell = random_cell
  #   cells_for_ship =[]
  #   cell_column = cell.delete("A-Z").to_i
  #   cell_row = cell.delete("0-9")
  #   direction = [:vertical, :horizontal].sample
  #
  #   if direction == :horizontal
  #     ship.length.times do |column_offset|
  #       cells_for_ship << "#{cell_row}#{cell_column + column_offset}"
  #     end
  #   else
  #     ship.length.times do |row_offset|
  #       cells_for_ship << "#{(cell_row.ord + row_offset).chr}#{cell_column}"
  #     end
  #   end
  #   cells_for_ship
  # end
  #
  # def place_computer_ships
  #    @ships.each do |ship|
  #      coordinates_to place
  #    end

  def get_coordinates_for_ship

  end

end
