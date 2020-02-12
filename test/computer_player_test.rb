require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/computer_player'
require './lib/board'
require './lib/cell'
require './lib/ship'

class ComputerPlayerTest < Minitest::Test

  def setup
    @todd = ComputerPlayer.new
  end

  def test_it_exists
    assert_instance_of ComputerPlayer, @todd
  end

  def test_it_has_a_board
    assert_instance_of Board, @todd.board
  end


  def test_it_can_generate_random_cells
    a_ship = mock("Shippy McShipface")
    assert_equal true, @todd.board.cells.has_key?(@todd.random_empty_cell)

    @todd.board.cells["A1"].place_ship(a_ship)

    assert_equal 15, @todd.board.cells.values.count {|cell| !cell.ship}
  end

  def test_it_chooses_cells_equal_to_ships_lengths
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("submarine", 2)

    assert_equal 3, @todd.cells_to_place_ship(cruiser).length
    assert_equal 2, @todd.cells_to_place_ship(submarine).length
  end

  def test_it_chooses_valid_coordinates_for_cells_to_place_ship
    cruiser = Ship.new("cruiser", 3)
    @todd.stubs(:random_empty_cell).returns("A1")
    @todd.stubs(:choose_direction).returns(:horizontal)

    assert_equal ["A1", "A2", "A3"], @todd.cells_to_place_ship(cruiser)
    @todd.stubs(:choose_direction).returns(:vertical)
    assert_equal ["A1", "B1", "C1"], @todd.cells_to_place_ship(cruiser)
  end

  def test_it_can_choose_direction
    assert_instance_of Symbol, @todd.choose_direction
  end

  def test_it_can_place_a_ships
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("submarine", 2)
    ships = [cruiser, submarine]

    @todd.place_all_ships(ships)
    # require "pry"; binding.pry
    # assert_equal 3,  @todd.board.cells.values.count {|cell| cell.ship.name == "cruiser"}
    # assert_equal 2,  @todd.board.cells.values.count {|cell| cell.ship.name == "submarine"}
    assert_equal 11, @todd.board.cells.values.count {|cell| cell.ship == nil}
  end

end
# place_computer_systems_or_whatever
#   for each of our ships
#     try to place the ship unil we place the ship
#   end
# we need a board to place ships on
# we need ships to place
# we need a computer/algorythm
