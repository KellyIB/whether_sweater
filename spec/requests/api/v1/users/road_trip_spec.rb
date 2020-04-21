require 'rails_helper'

RSpec.describe "road trip" do
  it "can get info for a new road trip " do
    user = User.create(email: "whatever@example.com", password: "password")
    user_input = { origin: "Denver,CO",
                   destination: "Pueblo,CO",
                   api_key: "#{user.api_key}" }

    post "/api/v1/road_trip", params: user_input

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json[:data][:attributes][:travel_time]).to eq(2)
    expect(json[:data][:attributes][:origin]).to eq(user_input[:origin])
    expect(json[:data][:attributes][:destination]).to eq(user_input[:destination])
    expect(json[:data][:attributes][:forecast].count).to eq(2)
  end
end
