class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_one_attached :photo
  validates :photo, presence: true
  validates :name, presence: true, uniqueness: true # A list must have a unique name.
end
