require 'rails_helper'

RSpec.describe "background image endpoint" do
  it "can get a background image for a city", :vcr do 
    city = "denver"
    state = "co"
    get "/api/v1/backgrounds?location=#{city},#{state}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json[:data][:attributes][:image]).to_not be_empty
    expect(json[:data][:attributes][:image]).to_not be_empty
    expect(json[:data][:id]).to_not be_empty
  end
end
