require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  context 'I visit a movie show page' do
    it 'I see its name, year, genre, and actor list/caluclations ' do
      studio_1 = Studio.create!(name: "New Pictures")
      movie_1 = studio_1.movies.create!(name: "BIG", year:1996, genre: "Horror")
      movie_2 = studio_1.movies.create!(name: "Crash", year:2004, genre: "Drama")
      actor_1 = Actor.create!(name: "Pete", age: 22)
      actor_2 = Actor.create!(name: "Mike", age: 40)
      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)

      visit "/movies/#{movie_1.id}"
      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(movie_1.year)
      expect(page).to have_content(movie_1.genre)
      expect(page).to have_content("Mike")
      expect(page).to have_content("Pete")
      expect(page).to have_content("Average age: 31")

  end
 end
end



# When I visit a movie's show page.
# I see the movie's name, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
