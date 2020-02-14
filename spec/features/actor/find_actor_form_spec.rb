require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  context 'I visit a movie show page' do
    it 'I see a form to add actor to the movie ' do
      studio_1 = Studio.create!(name: "New Pictures")
      movie_1 = studio_1.movies.create!(name: "BIG", year:1996, genre: "Horror")
      movie_2 = studio_1.movies.create!(name: "Crash", year:2004, genre: "Drama")
      actor_1 = Actor.create!(name: "Pete", age: 22)
      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)

      visit "/movies/#{movie_2.id}"
      expect(page).to have_content(movie_2.name)
      click_on "Add Actor"
      expect(current_path).to eq("/movies/#{movie_2.id}/actors/#{actor_1.id}")
  end

 end
end

# When I visit a movie show page,
# I see a form for an actors name
# and when I fill in the form with an existing actor's name
# I am redirected back to that movie's show page
# And I see the actor's name listed
