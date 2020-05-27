Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :users do
    get 'patients/register', to: 'patients/patient_registration#new', as: 'patient_registration'
    post 'patients/register', to: 'patients/patient_registration#create'

    get 'doctors/register', to: 'doctors/doctor_registration#new', as: 'doctor_registration'
    post 'doctors/register', to: 'doctors/doctor_registration#create'

    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :chat_messages
  resources :practices
  resources :license_activations
  resources :prescriptions, controller: 'prescriptions'

  resources :patients do
    get :dashboard, to: 'patients#dashboard', as: 'dashboard'
    get :profile
    get :connect_with_doctor, to: 'patient_chat_rooms#connect_with_doctor'

    resources :chat_rooms do
      post :send_transcript, to: 'patient_chat_rooms#send_transcript'
      get :end_session, to: 'patient_chat_rooms#end_session'
    end
    resources :questions
    resources :transcripts, controller: 'patients/transcripts'
    resources :consultation_requests, controller: 'consultation_requests'
    resources :urgent_requests, controller: 'urgent_requests' do
      get :wait_screen
      get :check_for_session_start
    end
    root to: 'patients#index'
  end

  resources :doctors do
    get :dashboard, to: 'doctors#dashboard', as: 'dashboard'
    get :accept_urgent_request, to: 'doctors#accept_urgent_request', as: 'accept_urgent_request'
    get :profile
    get :connect_with_patient, to: 'doctor_chat_rooms#connect_with_patient'

    resources :chat_rooms do
      post :send_transcript, to: 'doctor_chat_rooms#send_transcript'
      get :end_session, to: 'doctor_chat_rooms#end_session'
    end
    resources :transcripts, controller: 'doctors/transcripts'
    resources :consultation_requests, controller: 'doctors/consultation_request'
    root to: 'doctors#index'
  end

  namespace :doctor do
    resources :answers
  end

  root to: 'static#index'
end
