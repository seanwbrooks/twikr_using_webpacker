Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/stocks' => 'stocks#ticker_data'

  namespace :api do
    namespace :v1 do
      resources :tweets, only: [:index, :show, :new, :create, :destroy] do
        collection do
          get 'search'
        end
      end
      resources :reviews, only: [:index, :new, :create]
    end
  end
end
