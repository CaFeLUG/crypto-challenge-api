Rails.application.routes.draw do
  get 'main/index'
  root 'main#index'

  devise_for :users, skip: [:sessions, :registrations]
  resources :users, except: [:destroy, :update, :edit]
  post '/auth', as: 'auth', controller: :authentication, action: :authenticate
end
