class ForecastSearch
  attr_reader :forecast
  def initialize(city_state)
    @city_state = city_state
    @google_service = GoogleService.new
    @open_weather_service = OpenWeatherService.new
    @google_geocoding_data = geocoding_data
    @forecast = current_forecast
    # @background_image =
  end

  # def get_photo
  # end
  #
  def geocoding_data
    @data ||= @google_service.get_geocode_data(@city_state)
    @location ||= Location.new(@data, self)
  end

  def current_forecast
    weather = @open_weather_service.get_current_forecast(@location)
    Forecast.new(weather, @location.place_id)
  end
end
