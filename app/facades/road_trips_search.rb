# # rubocop:disable Naming/MemoizedInstanceVariableName

class RoadTripsSearch
  attr_reader :id, :forecast, :travel_time, :origin, :destination
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    @google_service = GoogleService.new
    @open_weather_service = OpenWeatherService.new
    @origin_location = geocoding_data(origin)
    @destination_location = geocoding_data(destination)
    @id = @destination_location.place_id + @origin_location.place_id
    @trip = road_trip_info(@origin_location, @destination_location)
    @forecast = destination_forecast.forecast
    @travel_time = @trip_forecast.travel_time
  end

  def geocoding_data(new_location)
    data = @google_service.get_geocode_data(new_location)
    location = Location.new(data)
    location
  end

  def road_trip_info(origin, destination)
    @trip_data ||= @google_service.get_road_trip_info(origin, destination)
    @trip ||= Trip.new(@trip_data)
    @trip
  end

  def destination_forecast
    weather = @open_weather_service.get_current_forecast(@destination_location)
    @trip_forecast ||= TripForecast.new(weather, @trip.travel_time)
    @trip_forecast
  end
end

# # rubocop:enable Naming/MemoizedInstanceVariableName
