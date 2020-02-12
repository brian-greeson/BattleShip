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
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
    @player1 = HumanPlayer.new(@ships)
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
              "The #{@ships[0].name} is three units long and the #{@ships[1].name} is two units long."

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

  def test_it_gets_cells_from_players_input
    Kernel.stubs(:gets).returns("A1 A2 A3")
    assert_equal ["A1", "A2", "A3"], @player1.get_cells
  end

  def test_place_ship
    Kernel.stubs(:gets).returns("A1 A2 A3")
    @player1.place_ship(@cruiser)
    Kernel.stubs(:gets).returns("B1 B2")
    @player1.place_ship(@submarine)
    result = @player1.board.cells.values.count {|cell| !cell.ship}

    assert_equal @cruiser, @player1.board.cells["A1"].ship
    assert_equal @cruiser, @player1.board.cells["A2"].ship
    assert_equal @cruiser, @player1.board.cells["A3"].ship
    assert_equal @submarine, @player1.board.cells["B1"].ship
    assert_equal @submarine, @player1.board.cells["B2"].ship
    assert_equal 11, result
  end

  def test place_ships


  end




end
