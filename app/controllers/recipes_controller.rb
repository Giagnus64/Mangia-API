class RecipesController < ApplicationController
    def index
        recipes = Recipe.all
        render json: UserRecipeSerializer.new(user.user_recipes).to_serialized_json
    end
    
    def create
        recipe = UserRecipe.create(user_recipe_params)
        puts user_recipe_params
        if(user_recipe.valid?)
            render json: user_recipe.to_json(except:[:created_at, :updated_at])
        else
            render json: user_recipe.errors.full_messages
        end
    end
    
    def destroy
        user_recipe = UserRecipe.find(params[:id])
        user_recipe.destroy()
        render json: {message:"Recipe removed from your bookmarks."}
    end
end
