require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require "./lib/human_player"
require "./lib/computer_player"

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
    assert_instance_of Ship, @game.ships[0]
    assert_instance_of Ship, @game.ships[1]
  end

  def test_it_starts_at_main_menu
    assert_equal :main_menu, @game.game_state
  end

  def test_user_can_quit_main_menu
    Kernel.stubs(:gets).returns("w")
    @game.main_menu

    refute_equal :quit, @game.game_state

    Kernel.stubs(:gets).returns("q")
    @game.main_menu

    assert_equal :quit, @game.game_state
  end

  def test_user_can_play_game_from_main_menu
    Kernel.stubs(:gets).returns("p")
    @game.main_menu
    assert_equal :setup, @game.game_state
  end

  def test_user_sees_both_boards_at_start_of_turn

  #   @game.players[:computer_player].board.cells["A1"].fire_upon
  #   @game.players[:computer_player].board.cells["A4"].fire_upon
  #   @game.players[:player1].board.cells["A1"].place_ship(@cruiser)
  #   @game.players[:player1].board.cells["A2"].place_ship(@cruiser)
  #   @game.players[:player1].board.cells["A3"].place_ship(@cruiser)
  #   @game.players[:player1].board.cells["C3"].place_ship(@submarine)
  #   @game.players[:player1].board.cells["D3"].place_ship(@submarine)
  #   @game.players[:player1].board.cells["B2"].fire_upon
  #   @game.players[:player1].board.cells["C1"].fire_upon
  #
  #   expected = "=============COMPUTER BOARD=============\n" +
  #              " 1 2 3 4 \n" +
  #              "A M . . M \n" +
  #              "B . . . . \n" +
  #              "C . . . . \n" +
  #              "D . . . . \n" +
  #              "==============PLAYER BOARD==============\n" +
  #              " 1 2 3 4 \n" +
  #              "A S S S . \n" +
  #              "B . M . . \n" +
  #              "C M . S . \n" +
  #              "D . . S . "
  #
  # assert_equal expected, @game.display_boards
  end

end
