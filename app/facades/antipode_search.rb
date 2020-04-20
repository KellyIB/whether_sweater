class AntipodeSearch
  attr_reader :forecast, :id, :antipode, :search_location, :today

  def initialize(starting_location)
    @search_location = starting_location
    @amypode_service = AmypodeService.new
    @open_weather_service = OpenWeatherService.new
    @antipode_coordinates = get_antipode_data
    @today = current_antipode_forecast.today
    @antipode = @location.formatted_address
    @id = @location.place_id
  end

  def get_antipode_data
    @antipode_data ||= @amypode_service.get_antipode(@search_location)
    @location ||= Location.new(@antipode_data, self)
  end

  def current_antipode_forecast
    weather = @open_weather_service.get_current_forecast(@location)
    AntipodeForecast.new(weather, @location.place_id)
  end
end
