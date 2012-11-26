# -*- encoding : utf-8 -*-
require 'net/http'

class GetWeatherData
  TEMPER_REG = /时间：(\d{1,2})时[#&\w&\d]*?温度：([-\d.]*?)℃(?:[#&\w&\d]*?最低温度：([-\d.]*?)℃)?(?:[#&\w&\d]*?最高温度：([-\d.]*?)℃)?/
  PRESS_REG = /时间：(\d{1,2})时[#&\w&\d]*?气压：([.\d]*)(.*?)\'/
  HUMID_REG = /时间：(\d{1,2})时[#&\w&\d]*?湿度：([.\d]*)/
  VISIB_REG = /时间：(\d{1,2})时[#&\w&\d]*?能见度：([\d.]*)(.*?)\'/

  @@http ||= Net::HTTP.new("www.hzqx.com")

  def self.temp
    instance = self.new
    resp = instance.get("/gzhfw/qxsk.asp")
    body = resp.body.encode("utf-8", "gbk")
    doc = Nokogiri::HTML(body)
    result = doc.css("div#line_1").children.map {|e|
      e.attributes["title"].value.gsub(/[\s ]/, '') rescue nil
    }.reject {|i|
      i.nil?
    }.map {|j|
      j.match(REGEX).captures
    }.last
    hour, temp, temp_low, temp_high = result.map{|e| e.nil? ? nil : e.to_f}
    time = Time.now.to_a
    time[0,3] = 0, 0, hour
    time[4] -= 1 if hour > Time.now.hour
    data_datetime = Time.local(*time).to_i
    [ data_datetime, { :temp      => temp,
                       :temp_low  => temp_low,
                       :temp_high => temp_high } ]
  end

  def self.pressure

  end

  def get(path)
    @@http.get path
  end
end
