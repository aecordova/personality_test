Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  root 'static_pages#home'

  resources :tests, only: [] do
    member do
      resources :responses, only: [:new, :create]
    end
  end

  resources :responses, only: [] do
    member do
      get :result, to: 'results#show'
    end
  end
end
