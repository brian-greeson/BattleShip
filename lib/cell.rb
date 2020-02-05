class Cell
  attr_reader :coordinate, :ship, :have_we_been_fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @have_we_been_fired_upon = false
  end

  def empty?
    @ship == nil
    # if @ship == nil
    #   return true
    # else
    #   return false
    # end
  end

  def place_ship(ship_parameter)
    @ship = ship_parameter
  end

  def fired_upon?
    @have_we_been_fired_upon
  end

  def fire_upon
    if self.empty? == false
      @ship.hit
    end

    @have_we_been_fired_upon = true

  end

  def render(reveal = false)
    return "S" if reveal

    if @have_we_been_fired_upon == false
      return "."
    end
    if @have_we_been_fired_upon == true && self.empty?
      return "M"
    end
    if @have_we_been_fired_upon == true && self.empty? == false
      if @ship.health == 0
        return "X"
      else
        return "H"
      end
    end

  end

end





#
# ****************************************
# ”.” if the cell has not been fired upon.
# “M” if the cell has been fired upon and it does not contain a ship (the shot was a miss).
# “H” if the cell has been fired upon and it contains a ship (the shot was a hit).
# “X” if the cell has been fired upon and its ship has been sunk.
# ****************************************
