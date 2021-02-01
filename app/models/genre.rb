class Genre < ApplicationRecord
  has_many :vinyls
  has_many :cds 
  has_many :cassette_tapes

  validates :name, presence: true, uniqueness: true
end
