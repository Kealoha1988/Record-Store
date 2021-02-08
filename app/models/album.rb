class Album < ApplicationRecord
  scope :bougie, -> {order(price: :desc)}
  scope :cheap, -> {order(price: :asc)}




  belongs_to :store
  belongs_to :user, optional: true 
  belongs_to :artist
  belongs_ to :genre

  validates :title, presence: true
  validates :format, presence: true
  validates :store_id, presence: true

  validates :title, presence: true
  validates :label, presence: true
  validates :release_date, presence: true
  validates :price, presence: true, :greater_than_or_equal_to => 1
  validates :genre_id, presence: true
  validates :format, presence: true

  accepts_nested_attributes_for :artist, :genre

end
