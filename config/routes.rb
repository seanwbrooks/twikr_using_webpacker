Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :tweets, only: [:index, :show, :new, :create, :destroy] do
        collection do
          get 'search'
        end
        resources :reviews, only: [:index, :new, :create]
      end
    end
  end
end
