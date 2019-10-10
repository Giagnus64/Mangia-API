class IngredientsController < ApplicationController

    def index
        ingredients = Ingredient.all
        render json: ingredients.to_json(except: [:created_at, :updated_at])
    end

    def create
        ingredient = Ingredient.find_or_create_by(ingredient_params)
        if(ingredient.valid?)
            render json: ingredient.to_json(except: [:created_at, :updated_at])
        else
            render json: ingredient.errors.full_messages
        end
    end

    private

    def ingredient_params
        params.permit(:name)
    end
end
