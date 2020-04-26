Rails.application.routes.draw do
  devise_for :users

  resources :chat_messages
  resources :chat_rooms
  resources :urgent_requests
  resources :consulation_requests
  resources :questions
  resources :answers
  resources :practices
  resources :patients
  resources :doctors

  root controller: :doctors, action: :index
end
