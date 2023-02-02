# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'rest-client'
puts 'cleaning database...'
# Bookmark.destroy_all
# List.destroy_all
# Movie.destroy_all
puts 'Getting movies from API...'

def fetch_movies
  base_poster_url = 'https://image.tmdb.org/t/p/'
  movies = RestClient.get 'https://tmdb.lewagon.com/movie/popular'
  movies_array = JSON.parse(movies)['results']
  movies_array.each do |movie|
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}w500#{movie['poster_path']}",
      rating: movie['vote_average']
    )
  end
end

fetch_movies
puts 'Seeding done!'
