class HumanPlayer
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def greeting
          "I have laid out my ships on the grid.\n" +
          "You now need to lay out your two ships.\n" +
          "The Cruiser is three units long and the Submarine is two units long."
  end





end
