Rails.application.routes.draw do
  resources :ingredients
  resources :likes
  resources :favorites
  resources :users

  #nesting likes in comments for recipe show page #
  resources :comments do
    resources :likes
  end

  # nesting comments in recipe for recipe show page #
  resources :recipes do 
    resources :comments
  end

  

  post 'signup', to: 'users#create'
  post 'login', to: 'users#login'
  patch 'edit', to: 'users#edit'
  delete 'delete', to: 'users#delete'

  #custom routes: ??
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
