require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_player'

class ComputerPlayerTest < Minitest::Test

  def setup
    @todd = ComputerPlayer.new
  end

  def test_it_exists
    assert_instance_of ComputerPlayer, @todd
  end


end

# place_computer_systems_or_whatever
#   for each of our ships
#     try to place the ship unil we place the ship
#   end
# we need a board to place ships on
# we need ships to place
# we need a computer/algorythm
