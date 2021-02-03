class Artist < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :albums
  has_many :genres, through: :albums

  accepts_nested_attributes_for :albumn
end
