NadaDemo::Application.routes.draw do

  #resources :nada_categories, only: [:show, :index]
  #get "nada_makes/:id(/:year)", to: 'nada_makes#show', as: "nada_make"

  resources :nada_makes, only: [:show, :index]


  resources :nada_models, only: [:show, :index]


  root "nada_makes#index"
end
