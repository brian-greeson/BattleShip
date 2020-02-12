require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/computer_player'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/human_player'

class HumanPlayerTest < Minitest::Test

  def setup
    @player1 = HumanPlayer.new
  end

  def test_it_exists
    assert_instance_of HumanPlayer, @player1
  end

  def test_it_has_a_board
    assert_instance_of Board, @player1.board
  end

  def test_it_receives_greeting
    expected = "I have laid out my ships on the grid.\n" +
              "You now need to lay out your two ships.\n" +
              "The Cruiser is three units long and the Submarine is two units long."
    assert_equal expected, @player1.greeting
  end

  def test_it_shows_player_their_board
    expected =  " 1 2 3 4 \n" +
               "A . . . . \n" +
               "B . . . . \n" +
               "C . . . . \n" +
               "D . . . . \n"
    assert_equal expected, @player1.board.render
  end



  # def test_player_receives_opening_message
  #   assert_equal
  #
  #     1 2 3 4
  #     A . . . .
  #     B . . . .
  #     C . . . .
  #     D . . . .
  #     Enter the squares for the Cruiser (3 spaces):, @player1.greeting
  # end
end
