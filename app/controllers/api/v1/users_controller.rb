# rubocop:disable Style/ClassAndModuleChildren

class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user)
    else
      render json: { status: 422, errors: user.errors }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :auth_token)
  end
end

# rubocop:enable Style/ClassAndModuleChildren
