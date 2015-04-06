Rails.application.routes.draw do
  root 'appointments#index'

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'

  get 'sign-out', to: 'sessions#destroy'
  get 'sign-in', to: 'sessions#new'
  post 'sign-in', to: 'sessions#create'

  resources :appointments

  resources :users do
    resources :appointments
  end

end
