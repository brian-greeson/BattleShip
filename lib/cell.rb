class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @have_we_been_fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_parameter)
    @ship = ship_parameter
  end

  def fired_upon?
    @have_we_been_fired_upon
  end

  def fire_upon
    @ship.hit if !empty? && !@have_we_been_fired_upon
    @have_we_been_fired_upon = true
  end

  def render(reveal = false)
    cell_status = "."
    if empty?
      cell_status = "M" if @have_we_been_fired_upon
    elsif @have_we_been_fired_upon && @ship.health == 0
        cell_status = "X"
    elsif @have_we_been_fired_upon
        cell_status = "H"
    elsif reveal
      cell_status = "S"
    end
    cell_status
  end
end
