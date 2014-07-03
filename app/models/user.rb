class User < ActiveRecord::Base
  validates :password, length: { minimum: 8}
  validates :username, uniqueness: true
  has_secure_password
end
