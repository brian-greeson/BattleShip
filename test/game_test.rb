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

  def test_game_has_board_by_default
    assert_instance_of Board, @game.board
  end


  def test_computer_can_place_ships
    board = Board.new

  end
end


# 1) Failure:
# GameTest#test_it_has_ships [test/game_test.rb:22]:
# No visible difference in the Hash#inspect output.
# You should look at the implementation of #== on Hash or its members.
# {:cruiser=>#<Ship:0xXXXXXX @name="Cruiser", @length=3, @health=3>, :submarine=>#<Ship:0xXXXXXX @name="Submarine", @length=2, @health=2>}
