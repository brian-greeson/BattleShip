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
    assert_instance_of Cell, @board.cells["D4"]
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

  # def test_ship_placement_is_valid
  #   assert_equal false, @board.valid_coordinate?(cruiser, ["A1", "A2"])
  #   assert_equal false, @board.valid_coordinate?(submarine, ["A2", "A3", "A4"])
  #   assert_equal false, @board.valid_coordinate?(cruiser, ["A1", "A2", "A4"])
  #   assert_equal false, @board.valid_coordinate?(submarine, ["A1", "C1"])
  #   assert_equal false, @board.valid_coordinate?(cruiser, ["A3", "A2", "A1"])
  #   assert_equal false, @board.valid_coordinate?(cruiser, ["A1", "B2", "C3"])
  #   assert_equal false, @board.valid_placement?(submarine, ["C2", "D3"])
  #   assert_equal true, @board.valid_placement?(submarine, ["A1", "A2"])
  #   assert_equal true, @board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  # end













end
