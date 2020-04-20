require 'rails_helper'

RSpec.describe "weather endpoint" do
  it "has current weather for an antipode city" do
    start_location = "hong kong"
    get "/api/v1/antipode?location=#{start_location}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json[:data][:attributes][:today].count).to eq(6)
    expect(json[:data][:attributes][:antipode]).to_not be_empty
    expect(json[:data][:attributes][:search_location]).to_not be_empty
  end
end
