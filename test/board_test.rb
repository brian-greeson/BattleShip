require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'


class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_has_cells
    assert_instance_of Hash, @board.cells
    assert_instance_of Cell, @board.cells["A1"]
    assert_equal 16, @board.cells.length
    assert_nil @board.cells["D5"]
    assert_equal "B3", @board.cells["B3"].coordinate
  end

  def test_valid_coordinate_knows_if_a_coordinate_is_on_the_board
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_ship_placement_is_valid
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_can_place_ship_in_cell
    assert_nil @board.cells["A1"].ship
    assert_nil @board.cells["A2"].ship
    assert_nil @board.cells["A3"].ship
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal @cruiser, @board.cells["A1"].ship
    assert_equal @cruiser, @board.cells["A2"].ship
    assert_equal @cruiser, @board.cells["A3"].ship
  end

  def test_a_cell_can_only_have_one_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
    @board.place(@submarine, ["A1", "A2", "A3"])
    refute_equal @submarine, @board.cells["A1"]

  end

  def test_render_renders_board
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expected1 = " 1 2 3 4 \n" +
                "A . . . . \n" +
                "B . . . . \n" +
                "C . . . . \n" +
                "D . . . . \n"

    expected2 = " 1 2 3 4 \n" +
                "A S S S . \n" +
                "B . . . . \n" +
                "C . . . . \n" +
                "D . . . . \n"

    assert_equal expected1, @board.render
    assert_equal expected2, @board.render(true)
  end

  def test_render_renders_possible_ship_states
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expected = " 1 2 3 4 \n" +
              "A . . . . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal expected, @board.render

    @board.cells["A1"].fire_upon
    expected = " 1 2 3 4 \n" +
              "A H . . . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal expected, @board.render

    @board.cells["B1"].fire_upon
    expected = " 1 2 3 4 \n" +
              "A H . . . \n" +
              "B M . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal expected, @board.render

    @board.cells["B1"].fire_upon
    expected = " 1 2 3 4 \n" +
              "A H S S . \n" +
              "B M . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal expected, @board.render(true)

    @board.cells["A2"].fire_upon
    @board.cells["A3"].fire_upon
    expected = " 1 2 3 4 \n" +
              "A X X X . \n" +
              "B M . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal expected, @board.render

  end

end
