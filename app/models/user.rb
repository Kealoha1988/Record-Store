class User < ApplicationRecord
  has_secure_password
  has_many :albums
  has_many :stores, through: :albums

  validates :username, presence: true
  validates :email, presence: true,  uniqueness: true


  def total_price
    self.albums.map{|a| a.price}.sum
  end

end
