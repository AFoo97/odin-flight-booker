# Airports
airport_codes = %w[SFO NYC LAX ORD DFW MIA]
airport_codes.each { |code| Airport.create!(code: code) }

# Flights
airports = Airport.all
10.times do
  departure = airports.sample
  arrival = (airports - [departure]).sample
  Flight.create!(
    departure_airport: departure,
    arrival_airport: arrival,
    start_datetime: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
    duration: rand(90..400)
  )
end

