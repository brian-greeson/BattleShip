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

  def test_it_starts_empty
    assert_equal true, @cell.empty?
  end

  def test_can_place_ship_in_cell
    assert_nil @cell.ship
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
  end

  def test_is_not_empty_after_placing_ship
    assert_equal true, @cell.empty?
    @cell.place_ship(@cruiser)
    assert_equal false, @cell.empty?
  end

  def test_it_starts_without_being_fired_upon
    assert_equal false, @cell.fired_upon?
  end

  def test_if_cell_can_be_fired_upon
    @cell.place_ship(@cruiser)
    assert_equal false, @cell.fired_upon?
    assert_equal 3, @cell.ship.health
    @cell.fire_upon
    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?
  end

  def test_not_fired_upon_renders_a_period
    assert_equal false, @cell.fired_upon?
    assert_equal ".", @cell.render
  end

  def test_when_empty_cell_is_fired_upon_renders_M
    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
    refute_equal "M", @cell.render
    assert_equal true, @cell.empty?
    assert_equal "M", @cell.render
  end

  def test_can_show_a_ship_not_fired_upon
    refute_equal "S", @cell.render(true)
    @cell.place_ship(@cruiser)
    refute_equal "S", @cell.render
    assert_equal "S", @cell.render(true)
  end

  def test_render_shows_hits_when_fired_upon_and_cell_not_empty
    @cell.place_ship(@cruiser)
    refute_equal "H", @cell.render
    assert_equal false, @cell.empty?
    @cell.fire_upon
    assert_equal "H", @cell.render
    assert_equal false, @cell.ship.sunk?
  end

  def test_render_shows_ship_sunk
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    refute_equal "X", @cell.render
    assert_equal false, @cruiser.sunk?
    @cell.fire_upon
    assert_equal false, @cruiser.sunk?
    @cell.fire_upon
    assert_equal true, @cruiser.sunk?
    assert_equal "X", @cell.render
  end

end
