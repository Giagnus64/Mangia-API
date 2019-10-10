class Recipe < ApplicationRecord
    has_many :user_recipes
    has_many :users, through: :user_recipes
    
    has_many :planned_meals
    
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    
    validates :title, presence: true



    def self.find_recipes_by_ingredient(search_query)
        self.all.select do |recipe|
            matches = recipe.ingredients.select do |ingredient|
                ingredient.name.downcase.include?(search_query.downcase)
            end
            if(matches.size != 0)
                true
            else 
                false
            end
        end
    end

    def self.make_recipes_from_results(search_results)
    
    end
end
