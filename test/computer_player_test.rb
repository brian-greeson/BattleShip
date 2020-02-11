require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_player'
require './lib/board'
require './lib/cell'

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
  #
  # def test_it_can_generate_random_cells
  #
  #   assert_equal true, @game.computer_board.cells.has_key?(@game.random_cell)
  #   refute_equal @game.random_cell, @game.random_cell
  # end

  # def test_it_chooses_cells_equal_to_ships_lengths
  #   assert_equal 3, @game.cells_for_computer_ship(@cruiser).length
  # end
  #
  # def test_it_choose_valid_coordinates
  #   cells_for_ship = @game.cells_for_computer_ship(@cruiser)
  #   all_coords_valid = false
  #   100_000.times do
  #     all_coords_valid = cells_for_ship.all? {|cell| @game.computer_board.valid_coordinate?(cell)}
  #     break if all_coords_valid
  #   end
  #
  #   assert_equal true, all_coords_valid
  #
  #   @game.computer_board.place(@cruiser, cells_for_ship)
  #
  #   assert_equal 11, @game.computer_board.cells.count {|cell| cell.empty?}
  # end

end

# place_computer_systems_or_whatever
#   for each of our ships
#     try to place the ship unil we place the ship
#   end
# we need a board to place ships on
# we need ships to place
# we need a computer/algorythm
