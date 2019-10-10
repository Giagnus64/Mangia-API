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
        search_results.map do |recipeObj|
            found_recipe = Recipe.find_by(page_url: recipeObj["recipe"]["url"])
            if(found_recipe)
                found_recipe
            else
                found_recipe = self.create_recipe_from_api(recipeObj)
                Ingredient.create_and_assign(recipeObj["recipe"]["ingredientLines"], found_recipe.id)
            end
            found_recipe
        end
    end

    def self.create_recipe_from_api(recipeObj)
        new_recipe = Recipe.create(title: recipeObj["recipe"]["label"], image_url: recipeObj["recipe"]["image"], page_url: recipeObj["recipe"]["url"], user_submitted:false, author: recipeObj["recipe"]["source"])
        new_recipe
    end
end
