Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :plants do
    resources :measurements
    scope module: :plants do
      resources :images
      resources :comments, only: %i[create]
    end
  end

  resources :users, only: %i[index show] do
    scope module: :users do
      resources :plants, only: %i[show]
    end
  end
end
