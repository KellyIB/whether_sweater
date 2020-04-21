class GoogleService
  def get_geocode_data(location)
    response = connection.get("/maps/api/geocode/json") do |f|
      f.params["address"] = location
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
