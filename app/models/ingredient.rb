class Ingredient < ApplicationRecord

    def self.create_and_assign(ingredients, recipe_id)
        ingredients.each do |ingredient|
            ingredient_record = self.find_or_create_by(name: ingredient)
            RecipeIngredient.create(ingredient_id: ingredient_record.id, recipe_id: recipe_id)
        end
    end

end
