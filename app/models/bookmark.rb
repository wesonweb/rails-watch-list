class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie_id, uniqueness: { scope: :list_id } # A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
  validates :comment, presence: true, length: { minimum: 6 } # The comment of a bookmark cannot be shorter than 6 characters.
end
