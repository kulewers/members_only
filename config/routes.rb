Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root 'posts#index'
  
  resources :posts, only: [:new, :create, :index, :show]
end
