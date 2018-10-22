require './auto'

class AutoSeeker
 attr_reader :data
  def initialize data
    @data = data.map do |row|
      Auto.new(row)
  end
end
  def filter key, match
     result = self.data.map do |auto|
      auto.send(key) == match
    end
  end

  def autos
    @autos ||= @data.map do |row|
      Auto.new(row)
    end
  end

  def self.median_mileage autos
    prices = autos.collect(&:mileage).sort
    (prices[(prices.length - 1) / 2].to_f + prices[prices.length / 2].to_f) / 2.0
  end

  def price_filter(lowest, higest)

    result = self.data.select do |x| 
      x.price >= lowest && x.price <= higest
    end
    return "No result found in that price range" if result.empty?
    show(result)
  end

  def fuel_filter(value)
    fuels = self.data.map {|x| x.fuel}.uniq 
    return "No Such fuel please select from #{fuels.to_s}" if !fuels.include?(value)
    show(self.data.select {|x| x.fuel == value})
  end

  private 

  def show(result)
    cars = []
    result.each do |k|
      cars << {:color => k.color, :price => k.price, :mileage => k.mileage, :fuel => k.fuel }
      end
      cars 
  end
end
