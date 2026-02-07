class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    params[:num_tickets].to_i.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking.id)
    else
      render :new, status: :unprocessable_content
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
  
  private

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      :num_tickets,
      passengers_attributes: [:name, :email]
    )
  end
end
