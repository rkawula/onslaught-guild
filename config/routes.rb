Rails.application.routes.draw do

  root 'guild#index'

  get 'blog', to: 'guild#blog'
  get 'events', to: 'guild#events'
  get 'forum', to: 'guild#forum'
  get 'history', to: 'guild#history'
  get 'apply', to: 'guild#apply'

end
