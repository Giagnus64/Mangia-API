class RecipeSerializer

    def initialize(recipes)
        @recipes = recipes    
    end

    def to_serialized_json
        @recipes.to_json({
            include: {
                ingredients: {only: [:name]},     
            },
            except: [:created_at, :updated_at]
        })
    end
end