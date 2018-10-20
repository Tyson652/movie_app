Rails.application.routes.draw do
  resources :movies do
    resources :reviews
    member do 
      get '/reviews', to: 'reviews#index'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
