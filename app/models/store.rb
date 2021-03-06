class Store < ApplicationRecord
  has_secure_password

  has_many :albums
  has_many :users, through: :albums
  validates :name, presence: true


end
