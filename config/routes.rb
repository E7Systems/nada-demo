NadaDemo::Application.routes.draw do


  resources :nada_makes, only: [:show, :index]

  resources :nada_models, only: [:show, :index]

  resources :nada_vehicles, only: [:show, :index, :update]

  #post "nada_vehicles/get_price", to: "nada_vehicles#get_price", as: "nada_vehicle_price"
  #get "nada_models(/:make_id)", to: "nada_models#index", as: "nada_models"

  root "nada_makes#index"
end
