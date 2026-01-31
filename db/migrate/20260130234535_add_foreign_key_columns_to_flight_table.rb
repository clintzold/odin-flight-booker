class AddForeignKeyColumnsToFlightTable < ActiveRecord::Migration[8.1]
  def change
    add_column :flights, :arrival_airport, :string
    add_column :flights, :departure_airport, :string

    add_foreign_key :flights, :airports, column: :arrival_airport, primary_key: :airport_code
    add_foreign_key :flights, :airports, column: :departure_airport, primary_key: :airport_code

    add_index :flights, :arrival_airport
    add_index :flights, :departure_airport
  end
end
