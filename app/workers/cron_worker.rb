# -*- encoding : utf-8 -*-
require 'net/http'

class CronWorker
  include Sidekiq::Worker

  def perform
    data_datetime, attr = GetWeatherData.qxsk
    data = WeatherData.find_or_create_by_data_datetime(data_datetime)
    data.update_attributes(attr)
  end
end
