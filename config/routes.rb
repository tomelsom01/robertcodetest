Rails.application.routes.draw do
  devise_for :users
  devise_for :registrations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

   root 'user_registrations#index'

   resources :user_registrations, path: 'registrations'

   get '/user_registration', to: 'user_registrations#new'
end
