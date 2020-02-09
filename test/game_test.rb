require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_starts_at_main_menu
    assert_equal :main_menu, @game.game_state
  end

  def test_user_can_quit_main_menu
    user_input = "q"
    @game.main_menu(user_input)
    assert_equal :quit, @game.game_state
  end

  def test_user_can_play_game_from_main_menu
    user_input = "p"
    @game.main_menu(user_input)
    assert_equal :play, @game.game_state 
  end
end
