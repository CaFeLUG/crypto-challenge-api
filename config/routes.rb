Rails.application.routes.draw do

  namespace :api do

    get 'main/index'
    root 'main#index'

    devise_for :users, skip: [:sessions, :registrations]

    resources :users, except: [:destroy, :update] do
      resources :contests, except: [:destroy, :update, :create]
    end
    resources :contests, except: [:destroy, :update, :create] do 
      resources :users, except: [:destroy, :update]
      resources :challenges, except: [:destroy, :update, :create] do
        resources :hints, except: [:destroy, :update, :create]
      end
    end

    post '/auth', as: 'auth', controller: :authentication, action: :authenticate

  end


end
