class UserRecipesController < ApplicationController
    def index
        user = User.find(params[:id])
        user.user_recipes
        render json: UserRecipeSerializer.new(user.user_recipes).to_serialized_json
    end
    
    def create
        user_recipe = UserRecipe.create(user_recipe_params)
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
     

    private
    
    def user_recipe_params
        params.permit(:user_id, :recipe_id)
    end

end
