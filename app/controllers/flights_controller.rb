class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @dates = Flight.pluck(:start_datetime).map { |d| d.to_date }.uniq.sort
    @num_tickets = [1, 2, 3, 4]

    if params[:commit] == "Search"
      @flights = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id]
      ).where("DATE(start_datetime) = ?", params[:date])
    end
  end
end
