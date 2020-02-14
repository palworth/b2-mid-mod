require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  context 'I visit a actor show page' do
    it 'I see their name, age, and list of movies ' do
      studio_1 = Studio.create!(name: "New Pictures")
      movie_1 = studio_1.movies.create!(name: "BIG", year:1996, genre: "Horror")
      movie_2 = studio_1.movies.create!(name: "Crash", year:2004, genre: "Drama")
      actor_1 = Actor.create!(name: "Pete", age: 22)
      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_2.id)

      visit "/actors/#{actor_1.id}"
      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_1.age)
      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(movie_2.name)


  end
 end
end

# When I visit an actor's show page,
# I see their name, their age, and a list of the names of all of the movies they are in.
