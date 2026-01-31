class ChangeCityCodeToAirportCode < ActiveRecord::Migration[8.1]
  def change
    rename_column :airports, :city_code, :airport_code
  end
end
