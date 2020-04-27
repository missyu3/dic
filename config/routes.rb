Rails.application.routes.draw do
  resources :users, path_names: { new: 'sign_up' }
end
