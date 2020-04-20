class AntipodeForecast
  attr_reader :today, :hourly, :five_day_forecast, :id
  def initialize(data, place_id)
    @id = place_id
    @today = current_weather(data)
  end

  def current_weather(data)
    weather_today =
      { forecast_dt: Time.at(data[:current][:dt]).to_s,
        description: data[:current][:weather][0][:description],
        current_temp: data[:current][:temp].round(0),
        feels_like: data[:current][:feels_like].round(0),
        humidity: data[:current][:humidity].round(0),
        uv_index: data[:current][:uvi].round(0) }
  end
end
