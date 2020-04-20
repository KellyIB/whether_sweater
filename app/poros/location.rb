class Location
  attr_reader :place_id, :lat, :lon, :formatted_address#, :location_photo_reference
  def initialize(geocode_data, search_facade)
    @search = search_facade
    # @location_photo_reference = location_data[:candidates][0][:photos][0][:photo_reference]
    @formatted_address = geocode_data[:results][0][:formatted_address]
    @lat = geocode_data[:results][0][:geometry][:location][:lat]
    @lon = geocode_data[:results][0][:geometry][:location][:lng]
    @place_id = geocode_data[:results][0][:place_id]
  end
end
