class TripForecast
  attr_reader :forecast, :travel_time
  def initialize(data, travel_time)
    @travel_time = travel_time_to_hours(travel_time)
    @forecast = hourly_weather_forecast(data, @travel_time)
  end

  def travel_time_to_hours(travel_time)
    string_time = travel_time[:text]
    split_string = string_time.split
    hours = (split_string[0]).to_i
    minutes_to_hour = ((split_string[2].to_f) / 60).round(0)
    time = hours + minutes_to_hour
  end


  def hourly_weather_forecast(data, travel_time)
    hourly_weather_today = data[:hourly]
    destination_forecast = {
      description: hourly_weather_today[(travel_time + 1)][:weather][0][:description],
      temp: hourly_weather_today[(travel_time + 1)][:temp].round(0)
                           }
  end
end
