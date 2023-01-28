class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, presence: true, uniqueness: true # A list must have a unique name.
end

# When you delete a list, you should delete all associated bookmarks
# (but not the movies as they can be referenced in other lists).
