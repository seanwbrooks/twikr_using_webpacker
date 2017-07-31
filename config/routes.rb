Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :tweets do
    resources :reviews
  end
end
