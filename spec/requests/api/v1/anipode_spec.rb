require 'rails_helper'

RSpec.describe "weather endpoint" do
  it "has current weather for a city" do
    start_location = "denver, co"
    get "/api/v1/antipode?location=#{start_location}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json[:data][:start_location][:antipode]).to_not be_empty
    expect(json[:data][:attributes][:today].count).to eq(11)
  end
end
