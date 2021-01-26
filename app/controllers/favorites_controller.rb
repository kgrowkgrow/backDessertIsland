class FavoritesController < ApplicationController

    before_action :authorized, only: [:create]

    def index
        favorites = Favorite.all
        render json: favorites
    end 

    def create
        favorite = Favorite.new(favorite_params)
        if favorite.save
            render json: favorite
        else 
            render json: favorite.errors
        end
    end

    def get_favorites 
        favorites = Favorite.select {|fav| fav.user === current_user}
    end

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :recipe_id)
    end

end
