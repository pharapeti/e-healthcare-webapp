Rails.application.routes.draw do
  devise_for :users

  root controller: :doctors, action: :index

  resources :patients
  resources :doctors
end
