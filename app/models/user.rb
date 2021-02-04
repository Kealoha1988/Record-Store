class User < ApplicationRecord
  has_secure_password
  has_many :albums
  has_many :stores, through: :albums

  validates :username, presence: true
  validates :email, presence: true
end
