Rails.application.routes.draw do
  devise_for :users

  resources :chat_rooms
  resources :chat_messages
  resources :urgent_requests
  resources :transcripts
  resources :answers
  resources :practices

  resources :patients do
    get :dashboard, to: 'patients#dashboard', as: 'dashboard'
    get :profile

    resources :questions
    resources :consulation_requests
    root to: 'patients#index'
  end

  resources :doctors do
    get :dashboard, to: 'doctors#dashboard', as: 'dashboard'
    get :profile
    root to: 'doctors#index'
  end

  root to: 'static#index'
end
