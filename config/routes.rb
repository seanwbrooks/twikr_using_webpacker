Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :tweets, only: [:index, :show, :create] do
        resources :reviews, only: [:index]
      end
    end
  end
end
