Rails.application.routes.draw do
  get 'main/index'
  root 'main#index'

  devise_for :users, skip: [:sessions, :registrations]
  resources :users, except: [:destroy, :update, :edit], param: :name
  post '/auth', as: 'auth', controller: :authentication, action: :authenticate
end
