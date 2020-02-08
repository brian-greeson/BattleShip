require "pry"
class Board
  attr_reader :cells
  def initialize
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

  def render(reveal_ship = false)
    board_size = board_length
    rows = rows_in_board(board_size)
    game_board = fill_rows_with_cells(board_size, rows, reveal_ship)

    format_game_board(board_size, rows, game_board)
  end

  def cells_in_row(row, number_of_columns, reveal_ship)
    cells = []
    number_of_columns.times do |column|
      cell = "#{row}#{column + 1}"
      cells << @cells[cell].render(reveal_ship)
    end
    cells
  end

  def rows_in_board(number_of_rows)
    rows = []
    number_of_rows.times do |row|
      row_label = (row + 65).chr
      rows << row_label
    end
    rows
  end

  def fill_rows_with_cells(board_size, rows, reveal_ship)
    rows_of_cells = []
    rows.each do |row|
      cells = cells_in_row(row, board_size, reveal_ship)
      rows_of_cells << cells
    end
    rows_of_cells
  end

  def format_game_board(board_size, row_labels, cell_renders_by_rows)
    formatted_game_board = ""
    board_size.times do |column|
      formatted_game_board += " #{column + 1}"
    end
    formatted_game_board += " \n"
    board_size.times do |row|
      formatted_game_board += "#{row_labels[row]} "
      formatted_game_board += cell_renders_by_rows[row].join(" ")
      formatted_game_board += " \n"
    end
    formatted_game_board
  end

  def board_length
    Math.sqrt(@cells.size).to_i
  end
end
