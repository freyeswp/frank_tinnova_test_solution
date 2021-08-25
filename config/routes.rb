Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#login'

  resources :beers
  post '/beer/:id/favorite', to: 'beers#add_favorite_beer'
  get '/favorite_beer', to: 'beers#get_favorite_beer'
end
