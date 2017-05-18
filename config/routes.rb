Rails.application.routes.draw do


  resources :sections
  resources :captures
  resources :devices
  resources :devices do
    resources :sections 
    resources :units do
      resources :captures do
        post 'shift_left', to: 'captures#shift_left'
        post 'shift_right', to: 'captures#shift_right'
      end
    end
  end
  resources :units

  # resources :challenge_attempts, :except => [:edit, :update, :show, :destroy]
  # resources :challenges, :except => [:edit, :update, :destroy]
  #
  # resources :challenges, :except => [:edit, :update, :destroy] do
  #   resources :challenge_attempts, :except => [:edit, :update, :show, :destroy]
  # end


  post 'generate', to: 'sections#generate'

  # get 'profiles', to: 'profile#index'
  get 'profile', to: 'profile#show'
  # get 'profile/:id', to: 'profile#show'

  get 'profile/edit'

  devise_for :users, :controllers => { registrations: 'registrations' }


  get '/about', to: 'dashboard#about'

  get '/temp', to: 'dashboard#temp'



  root 'devices#index'
end
