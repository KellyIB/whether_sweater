# rubocop:disable Style/ClassAndModuleChildren

class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: { status: 401, errors: "Incorrect Email or Password" }
    end
  end
end

# rubocop:enable Style/ClassAndModuleChildren
