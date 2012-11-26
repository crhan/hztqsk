# -*- encoding : utf-8 -*-
require 'net/http'

class GetWeatherData
  TEMPER_REG = /时间：(\d{1,2})时温度：([-\d.]*?)℃(?:最低温度：([-\d.]*?)℃)?(?:最高温度：([-\d.]*?)℃)?/
  PRESS_REG = /时间：(\d{1,2})时气压：([.\d]*)/
  HUMID_REG = /时间：(\d{1,2})时湿度：([.\d]*)/
  VISIB_REG = /时间：(\d{1,2})时能见度：([\d.]*)(.*?)\'/

  @@http ||= Net::HTTP.new("www.hzqx.com")

  def self.get_temp
    path="/gzhfw/qxsk.asp"
    data = get_data(path, TEMPER_REG)
    data_datetime, temp, temp_low, temp_high = data
    [ data_datetime, { :temp      => temp,
                       :temp_low  => temp_low,
                       :temp_high => temp_high } ]
  end

  def self.get_press
    path="/gzhfw/qxsk-qy.asp"
    data = get_data(path, PRESS_REG)
    data_datetime, pressure = data
    [ data_datetime, { :pressure => pressure } ]
  end

  def self.get_humid
    path = "/gzhfw/qxsk-sd.asp"
    data = get_data(path, HUMID_REG)
    data_datetime, humidity = data
    [ data_datetime, { :humidity => humidity } ]
  end


  def self.get_data path, regexp
    @@instance ||= self.new
    doc = Nokogiri.HTML @@instance.get(path).body.encode("utf-8", "gbk")
    hour_string, *attrs = html_parse(doc, regexp)
    hour = hour_string.to_i
    time = Time.now.to_a
    time[0,3] = 0, 0, hour
    time[4] -= 1 if hour > Time.now.hour
    data_datetime = Time.local(*time).to_i

    [ data_datetime, *attrs ]
  end

  def self.html_parse doc, regexp
    doc.css("div#line_1").children.map {|e|
      e.attributes["title"].value.gsub(/[\s ]/, '') rescue nil
    }.reject {|i|
      i.nil?
    }.last
    .match(regexp).captures
  end


  def get(path)
    @@http.get path
  end
end
