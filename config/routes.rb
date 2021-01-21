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

  # -- user routes -- # 

  post 'signup', to: 'users#create'
  post 'login', to: 'users#login'
  patch 'edit', to: 'users#edit'
  delete 'delete', to: 'users#delete'

  # -- recipe routes -- # 
  get 'get-recipe/:id', to: 'recipes#get_recipe'

  # -- comment routes -- # 
  # post 'new-comment', to: 'comments#new_comment'

end
