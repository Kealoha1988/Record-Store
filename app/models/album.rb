class Album < ApplicationRecord
  belongs_to :store
  belongs_to :user, optional: true 
  belongs_to :artist
  belongs_ to :genre

  validates :title, presence: true
  validates :format, presence: true
  validates :store_id, presence: true

  accepts_nested_attributes_for :artist, :genre
end
