# POST /api/v1/users
# Content-Type: application/json
# Accept: application/json
#
# {
#   "email": "whatever@example.com",
#   "password": "password"
#   "password_confirmation": "password"
# }
require 'rails_helper'

RSpec.describe "registration endpoint" do
  it "can register a user" do
    user_input = { email: "whatever@example.com",
                   password: "password",
                   password_confirmation: "password" }

    post "/api/v1/users", params: user_input

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
  end
end
