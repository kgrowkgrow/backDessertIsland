# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




# to do for seeds: 
#     - take dessert recipes from api (start with 10)
#     - then iterate through each recipe and create a new recipe with just the relevant info for your site
#     - profit

response = RestClient.get "https://api.spoonacular.com/recipes/complexSearch?type=dessert&apiKey=0a621ddf727e4e5d8ed5613700e4d56c&number=10"

json = JSON.parse response

id_arr = json.map do |recipe|
    recipe.id
end 

id_arr.each do |id|

    single_response = RestClient.get "https://api.spoonacular.com/recipes/#{id}/information?&apiKey=0a621ddf727e4e5d8ed5613700e4d56c&includeNutrition=true"
    recipe_json = JSON.parse single_response

    byebug
    
    recipe = Recipe.create(
        name: recipe_json.title, 
        ready_in_minutes: recipe_json.readyInMinutes, 
        image_url: recipe_json.image, 
        serving_size: recipe_json.servings, 
        instructions: recipe_json.instructions, 
        summary: recipe_json.summary,
        net_carbs: recipe_json.nutrition.nutrients[5].title
    )

    

end


