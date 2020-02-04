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

#
# pry(main)> cell_1 = Cell.new("B4")
# # => #<Cell:0x00007f84f11df920...>
#
# pry(main)> cell_1.render
# # => "."
#
# pry(main)> cell_1.fire_upon
#
# pry(main)> cell_1.render
# # => "M"
#
# pry(main)> cell_2 = Cell.new("C3")
# # => #<Cell:0x00007f84f0b29d10...>
#
# pry(main)> cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007f84f0ad4fb8...>
#
# pry(main)> cell_2.place_ship(cruiser)
#
# pry(main)> cell_2.render
# # => "."
#
# # Indicate that we want to show a ship with the optional argument
# pry(main)> cell_2.render(true)
# # => "S"
#
# pry(main)> cell_2.fire_upon
#
# pry(main)> cell_2.render
# # => "H"
#
# pry(main)> cruiser.sunk?
# # => false
#
# pry(main)> cruiser.hit
#
# pry(main)> cruiser.hit
#
# pry(main)> cruiser.sunk?
# # => true
#
# pry(main)> cell_2.render
# # => "X"
