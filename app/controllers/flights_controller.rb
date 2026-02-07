class FlightsController < ApplicationController
before_action :flight_params, only: [ :index ]
  def index

    unless flight_params.blank?
      search_params = {
        departure_date: params[:departure_date],
        departure_airport: flight_params[:departure_airport],
        arrival_airport: flight_params[:arrival_airport]
      }
      @flights = Flight.where(search_params)
    end
  end

  private

  def flight_params
    params.permit(:departure_date, :departure_airport, :arrival_airport, :num_tickets, :commit)
  end
end
