Rails.application.routes.draw do

  root 'guild#index'

  
  get 'login', to: 'sessions#new'
  get 'auth/bnet', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'blog', to: 'guild#blog'
  get 'events', to: 'guild#events'
  get 'forum', to: 'guild#forum'
  get 'history', to: 'guild#history'
  get 'apply', to: 'guild#apply'

end
