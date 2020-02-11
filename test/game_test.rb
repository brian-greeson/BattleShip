require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_has_ships
    assert_instance_of Ship, @game.ships[:cruiser]
    assert_instance_of Ship, @game.ships[:submarine]
  end

  def test_it_starts_at_main_menu
    assert_equal :main_menu, @game.game_state
  end

  def test_user_can_quit_main_menu
    user_input = "q"
    @game.main_menu(user_input)
    assert_equal :quit, @game.game_state

    user_input = "w"
    @game.main_menu(user_input)
    refute_equal :quit, @game.game_state
  end

  def test_user_can_play_game_from_main_menu
    user_input = "p"
    @game.main_menu(user_input)
    assert_equal :play, @game.game_state
  end

  def test_computer_can_generate_random_cells

    assert_equal true, @game.computer_board.cells.has_key?(@game.random_cell)
    refute_equal @game.random_cell, @game.random_cell
  end

  def test_computer_chooses_cells_equal_to_ships_lengths
    assert_equal 3, @game.cells_for_computer_ship(@cruiser).length
  end

  def test_computer_finds_valid_coordinates
    cells_for_ship = @game.cells_for_computer_ship(@cruiser)
    assert_equal true, cells_for_ship.all? {|cell| @game.computer_board.valid_coordinate?(cell)}
  end


  # end
  # def test_computer_finds_valid_placement
  #   skip
  #   cells_for_ship = @game.cells_for_computer_ship(@cruiser)
  #
  #   until @game.computer_board.valid_placement?(@cruiser, cells_for_ship)
  #     cells_for_ship = @game.cells_for_computer_ship(@cruiser)
  #   end
  #   assert_equal true, @game.computer_board.valid_placement?(@cruiser, cells_for_ship)
  #
  # end



  # def test_computer_generates_coordinates
  #   have the computer place ships by calling a method at this line
  #
  #
  #   subany?  check computer board cells .any? to include a sub
  #   cruiser?  check computer board cells .any? to include a cruiser
  #
  #   assert_equal true ,subany?
  #   assert_equal true ,cruiserany?
  # end



end
