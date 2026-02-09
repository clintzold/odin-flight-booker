class Booking < ApplicationRecord
  validates :flight_id, presence: true
  belongs_to :flight
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers
end
