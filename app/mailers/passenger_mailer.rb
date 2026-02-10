class PassengerMailer < ApplicationMailer
  default from: "booking-confirmation@kookoo.com"

  def booking_confirmation
    puts params
    @passenger = params[:passenger]
    @booking = params[:booking]
    mail(to: @passenger.email, subject: "Kookoo - Booking Confirmed")
  end
end
