class AmypodeService < GoogleService

  def get_antipode(start_city)
    data = get_geocode_data(start_city)
    binding.pry
    lat = data[:results][0][:geometry][:location][:lat].round(0)
    long = data[:results][0][:geometry][:location][:lng].round(0)


    connection = Faraday.new(url: "http://amypode.herokuapp.com") do |faraday|
      faraday.headers["api_key"] = ENV['Amypode_APIKEY']
    end

    response = connection.get("/maps/api/geocode/json") do |f|
      f.params["lat"] = lat
      f.params["long"] = long
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
