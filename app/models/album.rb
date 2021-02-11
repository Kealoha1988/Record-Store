class Album < ApplicationRecord
  scope :bougie, -> {order(price: :desc)}
  scope :cheap, -> {order(price: :asc)}
  scope :by_format, -> {order(format: :desc)}




  belongs_to :store
  belongs_to :user, optional: true 
  belongs_to :artist
  belongs_to :genre

  validates :title, presence: true
  validates :format, presence: true
  validates :store_id, presence: true

  validates :title, presence: true
  validates :label, presence: true
  validates :release_date, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :format, presence: true
  validates_numericality_of :price, :only_decimal => true, :greater_than_or_equal_to => 0

  accepts_nested_attributes_for :artist, :genre

end
