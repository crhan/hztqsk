# -*- encoding : utf-8 -*-
require 'net/http'

class CronWorker
  include Sidekiq::Worker

  def perform
    update_data GetWeatherData.get_temp
    update_data GetWeatherData.get_humid
    update_data GetWeatherData.get_press
  end

  private
  def update_data arr
    data_datetime, attr = arr
    WeatherData.find_or_create_by_data_datetime(data_datetime).update_attributes(attr)
  end
end
