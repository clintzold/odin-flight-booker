class RemoveFlightNumberFromFlightsTable < ActiveRecord::Migration[8.1]
  def change
    remove_column :flights, :flight_number
  end
end
