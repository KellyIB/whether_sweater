class OpenWeatherService
  def get_current_forecast(location)
    response = conn.get('onecall') do |req|
      req.params['lat'] = location.lat
      req.params['lon'] = location.lon
      req.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new "https://api.openweathermap.org/data/2.5" do |conn|
      conn.params['appid'] = ENV['OPEN_WEATHER_MAP_KEY']
    end
  end
end
