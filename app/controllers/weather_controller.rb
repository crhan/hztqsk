class WeatherController < ApplicationController
  def show
    @data = WeatherData.order("data_datetime DESC").limit(24)
  end
end
