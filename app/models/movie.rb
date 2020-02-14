class Movie < ApplicationRecord
  validates_presence_of :name, :year, :genre
    has_many :actor_movies
    has_many :actors, through: :actor_movies
    belongs_to :studio
end
