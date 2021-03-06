Rails.application.routes.draw do
  resources :ingredients, only: [:index, :create]
  resources :planned_meals, only: [:create, :destroy]
  resources :user_recipes, only: [:create, :destroy]
  resources :recipes, only: [:create, :destroy]
  resources :users, only: [:create]

  get "user_recipes/:id", to: 'user_recipes#index', as: "saved_recipes"
  get "planned_meals/:id", to: 'planned_meals#index', as: "planned_meals_by_user"
  get "recipes/:search_query", to: "recipes#index", as: "search_recipes"
  post '/login', to: 'login#create', as: 'login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
