class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_secure_password
end
