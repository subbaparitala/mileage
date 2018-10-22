class Auto
  attr_reader :color, :price, :fuel, :mileage

  def initialize data
    @color = data[1] || 'No color'
    @price = data[2] || 0.0
    @mileage = data[3] || 0.0
    @fuel = data[4] || 'air'
  end
end
