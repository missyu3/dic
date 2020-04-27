class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_secure_password

  validates :password, presence: true,
                       length: {minimum: 6}
end
