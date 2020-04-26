Rails.application.routes.draw do
  resources :transcripts
  devise_for :users

  resources :chat_rooms
  resources :chat_messages
  resources :urgent_requests
  resources :consulation_requests
  resources :questions
  resources :answers
  resources :practices
  resources :patients
  resources :doctors

  root controller: :doctors, action: :index
end
