Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :users do
    get 'patients/register', to: 'patients/patient_registration#new', as: 'patient_registration'
    post 'patients/register', to: 'patients/patient_registration#create'

    get 'doctors/register', to: 'doctors/doctor_registration#new', as: 'doctor_registration'
    post 'doctors/register', to: 'doctors/doctor_registration#create'
  end

  resources :chat_messages
  resources :transcripts
  resources :practices
  resources :license_activations

  resources :patients do
    get :dashboard, to: 'patients#dashboard', as: 'dashboard'
    get :profile
    get :connect_with_doctor, to: 'patient_chat_rooms#connect_with_doctor'

    resources :chat_rooms
    resources :questions
    resources :consultation_requests, controller: 'consultation_requests'
    resources :urgent_requests, controller: 'urgent_requests'
    root to: 'patients#index'
  end

  resources :doctors do
    resources :chat_rooms
    get :dashboard, to: 'doctors#dashboard', as: 'dashboard'
    get :profile
    root to: 'doctors#index'
  end

  namespace :doctor do
    resources :answers
  end

  root to: 'static#index'
end
