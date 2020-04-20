class Api::V1::AntipodesController < ApplicationController
  def show
    # binding.pry
    render json:  AntipodeSearch.new(params[:location])

#     connection = Faraday.new(url: "http://amypode.herokuapp.com") do |faraday|
#       faraday.headers["api_key"] = ENV['Amypode_APIKEY']
#     end
#
#     response = connection.get("/maps/api/geocode/json") do |f|
#       f.params["lat"] = location
#       f.params["long"] = location
#     end
#
#     JSON.parse(response.body, symbolize_names: true)
# binding.pry
end
end
