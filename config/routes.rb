Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  root 'static_pages#home'

  resources :test, only: [] do
    member do
      resources :responses, only: [:new, :create]
    end
  end

end
