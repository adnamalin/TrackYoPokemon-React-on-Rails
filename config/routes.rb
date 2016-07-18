Rails.application.routes.draw do
  root 'pokemons#index'
  resources :pokemons
  post '/' => 'pokemons#create'
  post '/search' => 'pokemons#search'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
