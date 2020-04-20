class GoogleService
  # def get_location_info(location)
  #   response = connection.get("/maps/api/place/findplacefromtext/json") do |f|
  #     f.params["input"] = location
  #     f.params["inputtype"] = "textquery"
  #     f.params["fields"] = "photos,place_id"
  #   end
  #   get_json(response)
  # end

  def get_geocode_data(location)
    response = connection.get("/maps/api/geocode/json") do |f|
      f.params["address"] = location
    end
    get_json(response)
  end
  #
  # def get_place_image(location)
  #   response = connection.get("/maps/api/geocode/json") do |f|
  #     f.params["address"] = location
  #   end
  #   get_json(response)
  # end

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
