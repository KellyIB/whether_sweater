class PexelService
  def get_photo(location)
    response = conn.get('/v1/search') do |req|
      req.params['query'] = location
      req.params['per_page'] = 1
      req.params['page'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new "https://api.pexels.com" do |conn|
      conn.headers['Authorization'] = ENV['PEXELS_KEY']
    end
  end
end
