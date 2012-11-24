class CreateWeatherData < ActiveRecord::Migration
  def change
    create_table :weather_data do |t|
      t.integer :temp
      t.integer :temp_low
      t.integer :temp_high
      t.integer :visibility
      t.integer :humidity
      t.integer :pressure

      t.timestamps
    end
  end
end
