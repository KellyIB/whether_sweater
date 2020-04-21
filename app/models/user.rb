require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates :password, confirmation: { case_sensitive: true }
  has_secure_password
  has_secure_token :api_key
end
