class Recipe < ApplicationRecord
    has_many :user_recipes
    has_many :users, through: :recipes
    
    has_many :planned_meals
    
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    
    validates :title, presence: true
end
