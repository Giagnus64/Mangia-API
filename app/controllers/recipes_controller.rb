require 'rest-client'

class RecipesController < ApplicationController
    # search both user created recipes and recipes from the api
    # conglomerate results
    def index
        search_param = params[:search_query]
        db_results = Recipe.find_recipes_by_ingredient(search_param)
        #search api and make recipe entries
        api_results = RestClient.get("https://api.edamam.com/search?q=#{search_param}&app_id=#{ENV['APP_ID']}&app_key=#{ENV['APP_KEY']}&to=50")
        parsed = JSON.parse(api_results)
        created_recipes_from_api = Recipe.make_recipes_from_results(parsed["hits"])
        results_array = db_results + created_recipes_from_api
        unique_array = results_array.uniq

        render json: RecipeSerializer.new(unique_array).to_serialized_json
    end

    #add recipe, ingredients, recipe_ingredients and save recipe to user_recipes
    def create
        puts recipe_params[:ingredients], recipe_params[:recipe], recipe_params[:user_id]
        recipe = Recipe.create(recipe_params[:recipe])
        if(recipe.valid?)
            Ingredient.create_and_assign(recipe_params[:ingredients], recipe.id)
            UserRecipe.create(recipe_id: recipe.id, user_id: recipe_params[:user_id])
            render json: RecipeSerializer.new(recipe).to_serialized_json
        else
            render json: recipe.errors.full_messages
        end
    end

    #destroy recipe and related ingredients
    def destroy
        recipe = Recipe.find(params[:id])
        recipe.destroy()
        render json: {message:"Recipe deleted."}
    end

    private
    def recipe_params 
        params.permit(:user_id, :search_query, ingredients: [], :recipe => [:title, :instructions, :image_url, :page_url, :user_submitted, :author])
    end
end
