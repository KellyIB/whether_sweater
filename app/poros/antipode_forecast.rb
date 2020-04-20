# rubocop:disable Metrics/MethodLength

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
        high_temperature: data[:daily][0][:temp][:max].round(0),
        low_temperature: data[:daily][0][:temp][:min].round(0),
        sunrise_dt: Time.at(data[:current][:sunrise]).to_s,
        sunset_dt: Time.at(data[:current][:sunset]).to_s,
        feels_like: data[:current][:feels_like].round(0),
        humidity: data[:current][:humidity].round(0),
        uv_index: data[:current][:uvi].round(0) }
  end
end

# rubocop:enable Metrics/MethodLength
