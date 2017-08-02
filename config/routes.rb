Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :tweets do
    resources :reviews
  end

  namespace :api do
    namespace :v1 do
      resources :tweets, only: [:index]
    end
  end
end
