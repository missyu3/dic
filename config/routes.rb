Rails.application.routes.draw do
  resources :blogs 
  resources :users, path_names: { new: 'sign_up' }
  resources :sessions, path_names: { new: 'sign_in' }
end
