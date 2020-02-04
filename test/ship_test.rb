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

end








#cruiser.health
# #=> 3
#
#cruiser.sunk?
# #=> false
#
#cruiser.hit
#
#cruiser.health
# #=> 2
#
#cruiser.hit
#
#cruiser.health
# #=> 1
#
#cruiser.sunk?
# #=> false
#
#cruiser.hit
#
#cruiser.sunk?
# #=> true
