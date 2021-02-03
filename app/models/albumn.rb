class Album < ApplicationRecord
  validates :title, presence: true
  validates :store_id, presence: true

  accepts_nested_attributes_for :artist, :genre
end
