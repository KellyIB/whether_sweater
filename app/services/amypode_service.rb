class AmypodeService < GoogleService
  def get_antipode(start_city)
    data = get_geocode_data(start_city)
    lat = data[:results][0][:geometry][:location][:lat]
    long = data[:results][0][:geometry][:location][:lng]

    resp = conn.get("/api/v1/antipodes") do |f|
      f.params["lat"] = lat
      f.params["long"] = long
    end

    json = get_antipode_json(resp)
    lat = json[:data][:attributes][:lat]
    lng = json[:data][:attributes][:long]
    a_data = get_antipode_city(lat, lng)
    a_data
  end

  private

  def get_antipode_json(response)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    conn = Faraday.new(url: "http://amypode.herokuapp.com") do |faraday|
      faraday.headers["api_key"] = ENV['Amypode_APIKEY']
    end
  end
end
