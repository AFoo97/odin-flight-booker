class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @dates = Flight.pluck(:start_datetime).map { |d| d.to_date }.uniq.sort
    @num_tickets = [1, 2, 3, 4]

    if params[:departure_airport_id].present? && params[:arrival_airport_id].present? && params[:date].present?
      @flights = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id]
        ).where(start_datetime: Date.parse(params[:date]).all_day)
    end
  end
end
