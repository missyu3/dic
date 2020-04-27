Rails.application.routes.draw do
  resources :sessions, path_names: { new: 'sign_in' }
  resources :users, path_names: { new: 'sign_up' }
end
