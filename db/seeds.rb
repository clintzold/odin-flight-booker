# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.create([
  { airport_code: "CHI" },
  {airport_code: "NYC"},
  {airport_code: "DET"},
  {airport_code: "TOR"},
  {airport_code: "CGY"},
  {airport_code: "EDM"},
  {airport_code: "VAN"},
  {airport_code: "WSH"},
  {airport_code: "COL"},
  {airport_code: "LAX"}
])

# Create flights
airports = Airport.all
num_of_airports = airports.length

airports.each do |airport|
  100.times do
    # Find airport to exclude
    id = airport.id
    # Create array of airport ID's excluding current airport
    airport_selection = ((id+1)-id...id).to_a + ((id+1)..num_of_airports).to_a
    # Randomnize duration of flight
    duration = rand(1.0..10.0).round(1)
    # Randomnize departure date
    departure_date = DateTime.now + rand(1..24).hours + rand(1..12).month
    # Select arrival airport at random
    arrival_id = airport_selection.sample

    airport.departing_flights.create(
      arrival_airport_id: arrival_id,
      departing: departure_date,
      flight_duration: duration
    )
  end
end
