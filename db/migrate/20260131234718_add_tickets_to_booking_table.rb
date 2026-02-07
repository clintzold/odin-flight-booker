class AddTicketsToBookingTable < ActiveRecord::Migration[8.1]
  def change
    add_column :bookings, :num_tickets, :integer, null: false
  end
end
