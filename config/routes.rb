Rails.application.routes.draw do
  resources :blogs 
  resources :users, path_names: { new: 'sign_up' }
end
