Rails.application.routes.draw do
  devise_for :users
  root 'post#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:new, :create, :index, :show, :destroy]

end
