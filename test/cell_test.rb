require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/cell"


class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_a_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_it_start_without_a_ship
    assert_nil @cell.ship
  end

  def test_it_can_be_empty
    assert_equal true, @cell.empty?
  end

  def test_can_place_ship_in_cell
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
  end

  def test_is_not_empty_after_placing_ship
    @cell.place_ship(@cruiser)
    assert_equal false, @cell.empty?
  end

  def test_it_starts_without_being_fired_upon
    assert_equal false, @cell.fired_upon?
  end

  def test_if_cell_can_be_fired_upon
    @cell.place_ship(@cruiser)
    @cell.fire_upon

    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?
  end


end




# pry(main)> cell.fired_upon?
# # => false
#
# pry(main)> cell.fire_upon
#
# pry(main)> cell.ship.health
# # => 2
#
# pry(main)> cell.fired_upon?
# # => true
