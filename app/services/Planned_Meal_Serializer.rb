class PlannedMealSerializer
    def initialize(planned_meals)
        @planned_meals = planned_meals
    end

    def to_serialized_json
        @planned_meals.to_json({
            include: {
               recipe: 
                {include: 
                    {ingredients: {only:[:name]}}, 
                except: [:created_at, :updated_at]}
           }, except: [:created_at, :updated_at]
        })
    end
end