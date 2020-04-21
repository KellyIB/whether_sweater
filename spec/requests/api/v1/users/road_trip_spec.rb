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
    binding.pry
    # expect(json[:data][:attributes][:email]).to eq(user.email)
    # expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
  end
end
