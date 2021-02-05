class Store < ApplicationRecord
  has_secure_password

  has_many :albums
  has_many :users, through: :albums
  validates :name, presence: true


  def aphabet
    @stores.order_by(name: :asc)
  end

  def price_filter(x)

    self.albums.order(x: :asc)
  end


end
