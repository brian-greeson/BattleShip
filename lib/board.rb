class Board

  def initialize(cells = {})
    create_list_of_cells.each do |cell_coordinate|
      @cell[cell_coordinate] = Cell.New(cell_coordinate)
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

end
