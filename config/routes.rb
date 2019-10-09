Rails.application.routes.draw do
  resources :recipe_ingredients, only: [:index, :create]
  resources :ingredients, only: [:index, :create]
  resources :planned_meals, only: [:index, :create, :destroy]
  resources :user_recipes, only: [:create, :destroy]
  resources :recipes, only: [:create, :show, :destroy]
  resources :users, only: [:create]

  get "user_recipes/:id", to: 'user_recipes#index', as: "saved_recipes"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
