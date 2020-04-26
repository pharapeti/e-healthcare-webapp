Rails.application.routes.draw do
  resources :urgent_requests
  resources :consulation_requests
  resources :questions
  resources :answers
  resources :practices
  devise_for :users

  root controller: :doctors, action: :index

  resources :patients
  resources :doctors
end
