class Store < ApplicationRecord
  has_secure_password

  has_many :albums
  validates :name, presence: true


  def aphabet
    @stores.order_by(name: :asc)
  end
end
