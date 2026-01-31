class RemoveAirportStringColumnsFromFlightsTable < ActiveRecord::Migration[8.1]
  def change
    remove_column :flights, :departure_airport
    remove_column :flights, :arrival_airport
  end
end
