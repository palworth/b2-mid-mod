Rails.application.routes.draw do
  get '/studios', to: 'studios#index'

  get '/actors/:id', to: 'actors#show'

  get '/movies/:id', to: 'movies#show'

  patch '/movies/:movie_id/actors/:id', to: 'actor_movies#update'
end
