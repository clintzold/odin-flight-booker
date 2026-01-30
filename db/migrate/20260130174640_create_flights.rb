class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.string :airline
      t.string :flight_number
      t.datetime :departing
      t.decimal :flight_duration

      t.timestamps
    end
  end
end
