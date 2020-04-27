Rails.application.routes.draw do
  get 'sessions/new'
  resources :users, path_names: { new: 'sign_up' }
end
