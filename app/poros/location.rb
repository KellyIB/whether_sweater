class Location
  attr_reader :place_id, :lat, :lon, :formatted_address
  def initialize(geocode_data, search_facade)
    @search = search_facade
    @formatted_address = geocode_data[:results][2][:formatted_address]
    @lat = geocode_data[:results][0][:geometry][:location][:lat]
    @lon = geocode_data[:results][0][:geometry][:location][:lng]
    @place_id = geocode_data[:results][0][:place_id]
  end
end
