class HumanPlayer
  attr_reader :board

  def initialize(ships = [])
    @board = Board.new
    @ships = ships
  end

  def greeting
          "I have laid out my ships on the grid.\n" +
          "You now need to lay out your two ships.\n" +
          "The #{@ships[0].name} is three units long and the #{@ships[1].name} is two units long."
  end

  def get_cells
    Kernel.gets.chomp.split(" ")
  end

  def place_ship(ship)
    cells = get_cells
    all_coords_valid = cells.all? { |cell| @board.valid_coordinate?(cell)}
    if all_coords_valid && @board.valid_placement?(ship, cells)
      @board.place(ship, cells)
    else
      return false
    end
  end

  def place_ships
    puts greeting
    @ships.each do |ship|
      puts @board.render(true)
      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
      until place_ship(ship)
        puts "Those are invalid coordinates. Please try again:"
      end
    end

    puts @board.render(true)
  end

  def pick_cell_to_fire_on(opponents_board)
    valid_selection = false
    puts "Enter the coordinate for your shot:"
    cell_to_fire_on = Kernel.gets.upcase.chomp
    until valid_selection
      if opponents_board.cells[cell_to_fire_on].fired_upon?
        valid_selection = false
      end
      if opponents_board.valid_coordinate?(cell_to_fire_on)
        valid_selection = true
      end

      puts "Please enter a valid coordinate:"
      cell_to_fire_on = Kernel.gets.upcase.chomp
    end
    cell_to_fire_on
  end




end
