Rails.application.routes.draw do
  resources :questions
  resources :answers
  resources :practices
  devise_for :users

  root controller: :doctors, action: :index

  resources :patients
  resources :doctors
end
