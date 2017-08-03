Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :tweets, only: [:index, :new, :create, :destroy] do
    resources :reviews, only: [:index, :new, :create, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :tweets, only: [:index, :show] do
        resources :reviews, only: [:index]
      end
    end
  end
end
