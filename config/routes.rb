Rails.application.routes.draw do

  root 'guild#index'
  resources :users
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new', :as => :login
  get '/logout', to: 'sessions#destroy', :as => :logout
  get '/auth/failure', to: 'sessions#failure'
  
  get 'blog', to: 'guild#blog'
  get 'events', to: 'guild#events'
  get 'forum', to: 'guild#forum'
  get 'history', to: 'guild#history'
  get 'apply', to: 'guild#apply'

end
