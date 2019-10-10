class User < ApplicationRecord
    has_many :user_recipes, dependent: :destroy
    has_many :recipes, through: :user_recipes
    
    has_many :planned_meals

    has_secure_password

    validates :username, presence: true, uniqueness: true


end
