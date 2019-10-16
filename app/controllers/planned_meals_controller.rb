class PlannedMealsController < ApplicationController
    
    def index
        user = User.find(params[:id])
        render json: PlannedMealSerializer.new(user.planned_meals).to_serialized_json
    end

    def create
        planned_meal = PlannedMeal.create(planned_meal_params)
        if(planned_meal.valid?)
            render json: PlannedMealSerializer.new(planned_meal).to_serialized_json
        else 
            render json: planned_meal.errors.full_messages
        end
    end

    def destroy
        planned_meal = PlannedMeal.find(params[:id])
        planned_meal.destroy()
        render json: {message: "#{planned_meal.recipe.title} removed"}
    end

    private
    def planned_meal_params
        params.permit(:date, :user_id, :recipe_id, :meal)
    end
end
