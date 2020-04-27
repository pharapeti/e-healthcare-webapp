Rails.application.routes.draw do
  devise_for :users

  resources :chat_rooms
  resources :chat_messages
  resources :urgent_requests
  resources :consulation_requests
  resources :transcripts
  resources :questions
  resources :answers
  resources :practices

  resources :patients do
    get :dashboard, to: 'patients#dashboard', as: 'dashboard'
    root to: 'patients#index'
  end

  resources :doctors do
    get :dashboard, to: 'doctors#dashboard', as: 'dashboard'
    root to: 'doctors#index'
  end

  root to: 'static#index'
end
