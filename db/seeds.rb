# Clear existing data
Airport.destroy_all
Flight.destroy_all

# Create airports
airport_codes = %w[SFO NYC LAX ORD DFW MIA]
airports = airport_codes.map { |code| Airport.create!(code: code) }

# Create flights for today and tomorrow between all airport pairs
dates = [Date.today, Date.today + 1]

dates.each do |date|
  airports.each do |departure|
    (airports - [departure]).each do |arrival|
      Flight.create!(
        departure_airport: departure,
        arrival_airport: arrival,
        start_datetime: date.to_time.change(hour: rand(6..22)), # random hour
        duration: rand(90..400)
      )
    end
  end
end

puts "Seeded #{Airport.count} airports and #{Flight.count} flights."

