# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Seeds database with airports and flights with random departures, arrivals, dates and durations
#
north_american_airports = [
  "YYZ",
  "YVR",
  "YUL",
  "YYC",
  "YEG",
  "YWG",
  "YOW",
  "YHZ",
  "YQB",
  "YXE",
  "YQR",
  "YYJ",
  "YLW",
  "YXT",
  "YYT"
]

# Create airports
north_american_airports.each do |code|
  Airport.create(airport_code: code)
end

# Create flights
airports = Airport.all
num_of_airports = airports.length

airports.each do |airport|
  # Find airport to exclude
  id = airport.id
  1000.times do |count|
    date = (Date.today..1.month.from_now).to_a.sample
    # Create array of airport ID's excluding current airport
    airport_selection = ((id+1)-id...id).to_a + ((id+1)..num_of_airports).to_a
    arrival_id = airport_selection.sample
    # Randomnize duration of flight
    duration = rand(1.0..10.0).round(1)
    # Randomnize departure time
    departure_time = rand(Time.current..24.hours.from_now)
    # Select arrival airport at random

    airport.departing_flights.create(
      arrival_airport_id: arrival_id,
      departure_date: date,
      departure_time: departure_time,
      flight_duration: duration
    )
    puts "#{count} Created flight from airport##{id} to airport##{arrival_id}"
  end
end
