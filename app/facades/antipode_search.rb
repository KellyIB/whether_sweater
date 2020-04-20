class AntipodeSearch

  def initialize(city_state)
    @city_state = city_state
    @amypode_service = AmypodeService.new
    @forecast_search = ForecastSearch.new(city_state)

    @antipode_coordinates = get_antipode_data
  end

  def get_antipode_data
    @anipode_data ||= @amypode_service.get_antipode(@city_state)
    binding.pry
  end

end
