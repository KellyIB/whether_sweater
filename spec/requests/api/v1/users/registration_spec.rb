require 'rails_helper'

RSpec.describe "registration endpoint" do
  it "can register a user" do
    user_input = { email: "whatever@example.com",
                   password: "password",
                   password_confirmation: "password" }

    post "/api/v1/users", params: user_input

    json = JSON.parse(response.body, symbolize_names: true)

    user = User.last

    expect(json).to_not be_empty
    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
  end

  it "can return an error if a user enters the wrong password" do
    user_input = { email: "whatever@example.com",
                   password: "password",
                   password_confirmation: "pasord" }

    post "/api/v1/users", params: user_input

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json[:status]).to eq(422)
    expect(json[:errors][:password_confirmation][0]).to eq("doesn't match Password")
  end

  it "can return an error if user tries to use a duplicate email" do
    user_input = { email: "whatever@example.com",
                   password: "password",
                   password_confirmation: "password" }

    post "/api/v1/users", params: user_input

    json = JSON.parse(response.body, symbolize_names: true)

    user = User.last

    expect(json).to_not be_empty
    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)

    post "/api/v1/users", params: user_input

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json[:status]).to eq(422)
    expect(json[:errors][:email][0]).to eq("has already been taken")
  end
end
