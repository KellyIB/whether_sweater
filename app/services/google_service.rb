class GoogleService
  def get_geocode_data(location)
    response = connection.get("/maps/api/geocode/json") do |f|
      f.params["address"] = location
    end
    get_json(response)
  end

  def get_road_trip_info(origin, destination)
    origin_coordinates = "#{origin.lat}" + "," + "#{origin.lon}"
    destination_coordinates = "#{destination.lat}" + "," + "#{destination.lon}"

    response = connection.get("/maps/api/directions/json") do |f|
      f.params["origin"] = origin_coordinates
      f.params["destination"] = destination_coordinates
    end
    get_json(response)
  end


  private

  def get_json(response)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["google_key"]
    end
  end
end
