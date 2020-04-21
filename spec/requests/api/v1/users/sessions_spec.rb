require 'rails_helper'

RSpec.describe "session endpoint" do
  it "can authenticate a user" do
    user = User.create(email: "whatever@example.com", password: "password")
    user_input = { email: "whatever@example.com",
                   password: "password" }

    post "/api/v1/sessions", params: user_input

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
  end

  it "can't authenticate a user with the wrong password or email" do
    user = User.create(email: "whatever@example.com", password: "password")
    user_input = { email: "whatever@example.com",
                   password: "passrd" }

    post "/api/v1/sessions", params: user_input

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json[:status]).to eq(401)
    expect(json[:errors]).to eq("Incorrect Email or Password")

    user_input = { email: "whateer@example.com",
                   password: "password" }

    post "/api/v1/sessions", params: user_input

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json[:status]).to eq(401)
    expect(json[:errors]).to eq("Incorrect Email or Password")
  end
end
