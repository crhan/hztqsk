class AddDataDatetimeToWeatherData < ActiveRecord::Migration
  def change
    add_column :weather_data, :data_datetime, :integer
  end
end
