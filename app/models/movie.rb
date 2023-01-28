class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true # A movie must have a unique title and an overview
  validates :overview, presence: true
  has_many :bookmarks
end
