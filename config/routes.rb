Rails.application.routes.draw do
  get 'sessions/new'
  resources :blogs 
  resources :users, path_names: { new: 'sign_up' }
end
