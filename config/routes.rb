Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    resources :reviews
    member do 
      get '/reviews', to: 'reviews#index'
    end
    member do
      get '/likes', to: 'likes#do_id_numbers'
    end
  end

  root to: 'movies#index'
  get '/explore', to: 'movies#explore'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
