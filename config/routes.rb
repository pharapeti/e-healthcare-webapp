Rails.application.routes.draw do
  resources :practices
  devise_for :users

  root controller: :doctors, action: :index

  resources :patients
  resources :doctors
end
