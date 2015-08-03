Rails.application.routes.draw do

  # Root
  root 'guild#index'

  # Log in/out
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new', :as => :login
  get '/logout', to: 'sessions#destroy', :as => :logout
  get '/auth/failure', to: 'sessions#failure'
  
  # Basic website sections
  get 'blog', to: 'guild#blog'
  get 'events', to: 'guild#events'
  get 'forum', to: 'guild#forum'
  get 'history', to: 'guild#history'
  get 'apply', to: 'guild#apply'

end
