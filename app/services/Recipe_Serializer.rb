class RecipeSerializer

    def initialize(recipes)
        @recipes = recipes    
    end

    def to_serialized_json
        @recipes.to_json({
            include: {
                ingredients: {except: [:created_at, :updated_at]},     
            },
            except: [:created_at, :updated_at]
        })
    end
end