Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    resources :reviews
    member do 
      get '/reviews', to: 'reviews#index'
    end
  end

  root to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
