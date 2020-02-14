class ActorMoviesController < ApplicationController
  def update
    require "pry"; binding.pry
      ActorMovie.create!(movie_id: params[:movie_id], actor_id: params[:actor_id]) ||= ActorMovie.find_by(movie_id: params[:movie_id], actor_id: params[:actor_id])]
  end
end
