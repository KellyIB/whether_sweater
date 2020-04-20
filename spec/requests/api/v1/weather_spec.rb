require 'rails_helper'

RSpec.describe "weather endpoint" do
  it "has current weather for a city" do
    city = "denver"
    state = "co"
    get "/api/v1/forecast?location=#{city},#{state}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json[:data][:attributes][:today].count).to eq(11)
    expect(json[:data][:attributes][:hourly].count).to eq(8)
    expect(json[:data][:attributes][:five_day_forecast].count).to eq(5)
  end

end
