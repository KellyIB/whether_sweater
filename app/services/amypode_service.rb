class AmypodeService < GoogleService

  def get_antipode(start_city)
    results = get_geocode_data(start_city)
    binding.pry
    lat =


    connection = Faraday.new(url: "http://amypode.herokuapp.com") do |faraday|
      faraday.headers["api_key"] = ENV['Amypode_APIKEY']
    end

    response = connection.get("/maps/api/geocode/json") do |f|
      f.params["lat"] = location
      f.params["long"] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
