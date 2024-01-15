Rails.application.routes.draw do
  root 'home#index'

  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :dashboard, only: %i[index]

  resources :todos

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  end
end
