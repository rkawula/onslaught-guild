Rails.application.routes.draw do

  root 'guild#index'

  # Static pages.
  get 'history', to: 'guild#history'

end
