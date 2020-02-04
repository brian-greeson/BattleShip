class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def empty?
    @ship == nil
  end
end
