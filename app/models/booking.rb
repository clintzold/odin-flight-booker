class Booking < ApplicationRecord
  validates :flight_id, presence: true

  belongs_to :flight
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers

  after_create_commit :send_booking_confirmations

  private

  def send_booking_confirmations
    self.passengers.each do |passenger|
      PassengerMailer.booking_confirmation.with(booking: self, passenger: passenger).deliver_later
    end
  end
end
