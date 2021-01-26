class FavoritesController < ApplicationController
    before_action :authorized, only: [:get_favorites, :create]
    def index
        favorites = Favorite.all
        render json: favorites
    end 

    def create
        favorite = Favorite.new(favorite_params)
        favorite.update(user: current_user)
        if favorite.save
            render json: favorite.recipe
        else 
            render json: favorite.errors
        end
    end

    def get_favorites
            recipes = Recipe.select {|rec| current_user.favorite_recipes.include?(rec)}
            render json: recipes
    end

    private

    def favorite_params
        params.require(:favorite).permit(:recipe_id, :user_id)
    end

end
