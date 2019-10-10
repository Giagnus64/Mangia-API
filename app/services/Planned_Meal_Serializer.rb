class PlannedMealSerializer
    def initialize(planned_meals)
        @planned_meals = planned_meals
    end

    def to_serialized_json
        @planned_meals.to_json({
            include: {
                recipe: {only: [:title, :id, :page_url]}
            }, except: [:created_at, :updated_at]
        })
    end
end