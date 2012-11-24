class CreateWeatherData < ActiveRecord::Migration
  def change
    create_table :weather_data do |t|
      t.float :temp
      t.float :temp_low
      t.float :temp_high
      t.float :visibility
      t.float :humidity
      t.float :pressure

      t.timestamps
    end
  end
end
