class Cell
  attr_reader :coordinate, :ship

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
    @ship.hit
    @have_we_been_fired_upon = true
  end

end
