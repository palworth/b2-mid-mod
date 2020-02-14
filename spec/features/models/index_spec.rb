require 'rails_helper'

RSpec.describe " When I visit studio index" do
  it "displays list of the studios  " do
    studio_1 = Studio.create!(name: "New Pictures")
    studio_2 = Studio.create!(name: "Fun Videos")
    movie_1 = studio_1.movies.create!(name: "BIG", year:1996, genre: "Horror")
    movie_2 = studio_2.movies.create!(name: "Crash", year:2004, genre: "Drama")

      visit '/studios'
      expect(page).to have_content(studio_1.name)
      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(studio_2.name)
      expect(page).to have_content(movie_2.name)

  end

end
