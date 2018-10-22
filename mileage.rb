require 'csv'
require './auto_seeker'
require 'byebug'

data = CSV.read('foobarnian_autos.csv', { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
hashed_data = data.map { |d| d.to_hash }
seeker = AutoSeeker.new data

autos = seeker.filter(:color, ARGV[0])


if autos.length == 0
  abort "no autos with color #{ARGV[0]} found"
end

mileage = AutoSeeker.median_mileage(autos)
price = seeker.price_filter(10000.37, 20000)
puts "median mileage = #{mileage} MPG"



gas = seeker.fuel_filter('gas')

puts gas 
