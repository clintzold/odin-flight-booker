class RemoveNumTicketsFromBookings < ActiveRecord::Migration[8.1]
  def change
    remove_column :bookings, :num_tickets
  end
end
