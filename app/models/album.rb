class Album < ApplicationRecord
  belongs_to :store
  has_one :artist
  has_one :genre

  validates :title, presence: true
  validates :format, presence: true
  validates :store_id, presence: true

  accepts_nested_attributes_for :artist, :genre
end
