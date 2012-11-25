class WeatherController < ApplicationController
  def show
    @data = WeatherData.limit(24)
  end
end
