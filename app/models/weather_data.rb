class WeatherData < ActiveRecord::Base
  attr_accessible :humidity,
                  :pressure,
                  :temp,
                  :temp_high,
                  :temp_low,
                  :visibility,
                  :data_datetime
end
