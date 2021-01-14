Rails.application.routes.draw do
  resources :likes
  resources :favorites
  resources :comments
  resources :recipes
  resources :users

  post 'signup', to: 'users#create'
  post 'login', to: 'users#login'

  #custom routes: ??
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
