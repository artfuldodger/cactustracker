Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :plants do
    resources :measurements
    resources :images, only: %i[new create], controller: :plant_images
  end

  resources :users, only: %i[index show] do
    scope module: :users do
      resources :plants, only: %i[show]
    end
  end
end
