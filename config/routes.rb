Rails.application.routes.draw do
  root to: "blog#index"

  resources :blogs 

  get "/mypage/:id", to: "users#show", as: "user_mypage"
  resources :users, path_names: { new: 'sign_up' }
  
  resources :sessions, path_names: { new: 'sign_in' }

end
