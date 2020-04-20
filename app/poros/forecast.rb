class Forecast 
  attr_reader :today, :hourly, :five_day_forecast, :id
  def initialize(data, place_id)
    @id = place_id
    @today = current_weather(data)
    @hourly = hourly_weather_forecast(data)
    @five_day_forecast = five_days_forecast(data)
  end

  def current_weather(data)
    weather_today = { forecast_dt: Time.at(data[:current][:dt]).to_s,
                    description: data[:current][:weather][0][:description],
                    current_temp: data[:current][:temp].round(0),
                    high_temperature: data[:daily][0][:temp][:max].round(0),
                    low_temperature: data[:daily][0][:temp][:min].round(0),
                    sunrise_dt: Time.at(data[:current][:sunrise]).to_s,
                    sunset_dt: Time.at(data[:current][:sunset]).to_s,
                    feels_like: data[:current][:feels_like].round(0),
                    humidity: data[:current][:humidity].round(0),
                    visibility_in_miles: (data[:current][:visibility])/1609.344.round(0),
                    uv_index: data[:current][:uvi].round(0) }
  end

  def hourly_weather_forecast(data)
    hourly_weather_today = data[:hourly].take(8)
    hourly_weather_today.map do |hour|
      { forecast_dt: Time.at(hour[:dt]).to_s,
        description: hour[:weather][0][:description],
        temp: hour[:temp].round(0) }
    end
  end

  def five_days_forecast(data)
    (data[:daily].shift)
    five_day_forecast = data[:daily].take(5)
    five_day_forecast.map do |day|
      { forecast_dt: Time.at(day[:dt]).to_s,
        description: day[:weather][0][:description],
        rain: day[:rain],
        high_temperature: day[:temp][:max].round(0),
        low_temperature: day[:temp][:min].round(0) }
    end
  end
end
