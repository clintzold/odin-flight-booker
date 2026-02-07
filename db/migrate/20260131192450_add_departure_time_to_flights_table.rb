class AddDepartureTimeToFlightsTable < ActiveRecord::Migration[8.1]
  def change
    add_column :flights, :departure_time, :time
    change_column :flights, :departing, :date
    rename_column :flights, :departing, :departure_date
  end
end
