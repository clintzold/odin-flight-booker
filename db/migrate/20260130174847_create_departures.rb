class CreateDepartures < ActiveRecord::Migration[8.1]
  def change
    create_table :departures do |t|
      t.references :airport, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
