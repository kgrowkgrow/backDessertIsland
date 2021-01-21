class RecipesController < ApplicationController

    def index
        recipes = Recipe.all 
        render json: recipes
    end
    
    def show
        recipe = Recipe.find(params[:id])
        render json: recipe
    end

    def get_recipe
        if logged_in?
            recipe = Recipe.find_by_id(params[:id])
            ingredients = Ingredient.select { |ingredient| ingredient.recipe.id == recipe.id}
            comments = Comment.select { |comment| comment.recipe.id == recipe.id }
            render json: {comments: comments, ingredients: ingredients} and return
        end 
    end
end
