class AddDeparturesAndArrivalsColumnsToFlights < ActiveRecord::Migration[8.1]
  def change
    add_reference :flights, :departure_airport, foreign_key: { to_table: :airports }, null: false
    add_reference :flights, :arrival_airport, foreign_key: { to_table: :airports }, null: false
  end
end
