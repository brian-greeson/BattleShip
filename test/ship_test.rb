require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"


class ShipTest < Minitest::Test


  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_has_a_name
    assert_equal "Cruiser", @cruiser.name
  end

  def test_test_ship_has_a_length
    assert_equal 3, @cruiser.length
  end

  def test_it_has_health
    assert_equal 3, @cruiser.health
  end

  def test_it_starts_not_sunk
    assert_equal false, @cruiser.sunk?
  end

  def test_it_can_take_a_hit
    @cruiser.hit
    assert_equal 2, @cruiser.health
  end

  def test_it_can_sink
    3.times {@cruiser.hit}

    assert_equal true, @cruiser.sunk?
  end

end






#cruiser.sunk?
# #=> true
