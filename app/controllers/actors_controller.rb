class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])
  end

  def update
    require "pry"; binding.pry
  end
end
