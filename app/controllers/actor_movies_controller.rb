class ActorMoviesController < ApplicationController
  def update
    @actormovie = ActorMovie.find_by(movie_id: params[:movie_id], actor_id: params[:actor_id])
    if  @actormovie.nil?
      @actormovie.Create(movie_id: params[:movie_id], actor_id: params[:actor_id])
    require "pry"; binding.pry
  end
end
