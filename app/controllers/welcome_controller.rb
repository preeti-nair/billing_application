class WelcomeController < ApplicationController
  def index
    @bookings = Client.bookings(params["selector"]).order(expected_schedule: :desc)
  end
end
