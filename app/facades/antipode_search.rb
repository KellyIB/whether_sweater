class AntipodeSearch

  def initialize(city_state)
    @city_state = city_state
    @amypode_service = AmypodeService.new
    @open_weather_service = OpenWeatherService.new
    @antipode_coordinates = get_antipode_data
    @forecast = current_antipode_forecast
  end

  def get_antipode_data
    @antipode_data ||= @amypode_service.get_antipode(@city_state)
    @location ||= Location.new(@antipode_data, self)
  end

  def current_antipode_forecast
    weather = @open_weather_service.get_current_forecast(@location)
    AntipodeForecast.new(weather, @location.place_id)
  end

end
