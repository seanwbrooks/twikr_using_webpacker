Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :tweets do
    resources :reviews, only: [:create, :update, :edit, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :tweets, only: [:index, :show, :new, :create, :delete] do
        resources :reviews, only: [:index]
      end
    end
  end
end
