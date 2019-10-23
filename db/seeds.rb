# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Recipe.destroy_all
UserRecipe.destroy_all
PlannedMeal.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all


u1 = User.create(username:"bob", password:"pop")
u2 = User.create(username:"jane", password:"pop")
u3 = User.create(username:"emily", password:"pop")
u4 = User.create(username:"mark", password:"pop")
u5 = User.create(username:"sara", password:"pop")

pasta = Recipe.create(image_url:"https://pbs.twimg.com/profile_images/947289512518082560/w4SW8C3c_400x400.jpg", title:"Spaghetti and Meatballs", instructions:"Boil Pasta. Make Meatballs. Make Sauce. Put together.", user_submitted:true, author: u1.username)
rice = Recipe.create(image_url:"http://s1.grouprecipes.com/images/recipes/200/3045149468.jpg", page_url:"http://www.grouprecipes.com/47203/twice-as-nice-rice-ideas-for-leftover-rice.html", title:"Twice As Nice Rice", user_submitted:false)
chicken = Recipe.create(image_url:"https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/1/11/0/FNK_Keto-Breaded-Chicken-Cutlets-H1_s4x3.jpg.rend.hgtvcom.826.620.suffix/1547244638716.jpeg",  title:"Chicken Cutlets", instructions:"Tenderize Chicken. Coat in egg, flour and breadcrumb mixture. Fry Chicken.", user_submitted:true, author: u1.username, page_url:nil)
cake = Recipe.create(image_url:"https://assets.bonappetit.com/photos/5d9152dc8f210f00089d645b/16:9/w_2560,c_limit/HLY-1019-Blueberry-Crumb-Cake-Horizontal.jpg", page_url:"https://www.bonappetit.com/recipe/blueberry-miso-crumb-cake", title:"Blueberry Miso Crumb Cake", user_submitted: false)
tuna = Recipe.create(image_url:"https://images-gmi-pmc.edge-generalmills.com/7eb09e32-fb06-4a34-97e6-def91b62164f.jpg", page_url:"https://www.bettycrocker.com/recipes/tuna-salad-sandwiches/1516cf19-d7c2-44ea-8698-5e9f3c5aed4d", title:"Tuna Salad Sandwiches", user_submitted:false)

ur1 = UserRecipe.create(user_id: u1.id, recipe_id: pasta.id)
ur2 = UserRecipe.create(user_id: u1.id, recipe_id: chicken.id)
ur3 = UserRecipe.create(user_id: u2.id, recipe_id: pasta.id)
ur4 = UserRecipe.create(user_id: u1.id, recipe_id: cake.id)
ur5 = UserRecipe.create(user_id: u2.id, recipe_id: tuna.id)
ur6 = UserRecipe.create(user_id: u2.id, recipe_id: rice.id)
ur7 = UserRecipe.create(user_id: u3.id, recipe_id: tuna.id)
ur8 = UserRecipe.create(user_id: u3.id, recipe_id: cake.id)
ur9 = UserRecipe.create(user_id: u4.id, recipe_id: chicken.id)
ur10 = UserRecipe.create(user_id: u4.id, recipe_id: rice.id)

pm1 = PlannedMeal.create(user_id: u1.id, recipe_id: pasta.id, meal:"Dinner", date:"2019-10-12")
pm11 = PlannedMeal.create(user_id: u1.id, recipe_id: pasta.id, meal:"Dinner", date:"2019-10-13")
pm2 = PlannedMeal.create(user_id: u1.id, recipe_id: chicken.id, meal:"Lunch", date:"2019-10-11")
pm3 = PlannedMeal.create(user_id: u2.id, recipe_id: pasta.id, meal:"Lunch", date:"2019-10-13")
pm4 = PlannedMeal.create(user_id: u1.id, recipe_id: cake.id, meal:"Dinner", date:"2019-10-12")
pm5 = PlannedMeal.create(user_id: u2.id, recipe_id: tuna.id, meal:"Lunch", date:"2019-10-10")
pm6 = PlannedMeal.create(user_id: u2.id, recipe_id: rice.id, meal:"Breakfast", date:"2019-10-11")
pm7 = PlannedMeal.create(user_id: u3.id, recipe_id: tuna.id, meal:"Breakfast", date:"2019-10-12")
pm8 = PlannedMeal.create(user_id: u3.id, recipe_id: cake.id, meal:"Lunch", date:"2019-10-10")
pm9 = PlannedMeal.create(user_id: u4.id, recipe_id: chicken.id, meal:"Dinner", date:"2019-10-10")
pm10 = PlannedMeal.create(user_id: u4.id, recipe_id: rice.id, meal:"Lunch", date:"2019-10-12")

i1 = Ingredient.create(name:"1 lb chicken")
i2 = Ingredient.create(name:"1 lb spaghetti")
i3 = Ingredient.create(name:"1 lb ground beef")
i4 = Ingredient.create(name:"1 cup basil")
i5 = Ingredient.create(name:"2 cups blueberries")
i6 = Ingredient.create(name:"3 cups breadcrumbs")
i7 = Ingredient.create(name:"4 eggs")
i8 = Ingredient.create(name:"1 cup flour")
i9 = Ingredient.create(name:"2 cans of tuna")
i10 = Ingredient.create(name:"2 cups mayonnaise")
i11 = Ingredient.create(name:"8 scallions")
i12 = Ingredient.create(name:"1 quart tomato sauce")

ri1 = RecipeIngredient.create(recipe_id:chicken.id, ingredient_id: i1.id)
ri2 = RecipeIngredient.create(recipe_id:pasta.id, ingredient_id: i2.id)
ri3 = RecipeIngredient.create(recipe_id:pasta.id, ingredient_id: i3.id)
ri4 = RecipeIngredient.create(recipe_id:pasta.id, ingredient_id: i4.id)
ri5 = RecipeIngredient.create(recipe_id:cake.id, ingredient_id: i5.id)
ri6 = RecipeIngredient.create(recipe_id:chicken.id, ingredient_id: i6.id)
ri7 = RecipeIngredient.create(recipe_id:chicken.id, ingredient_id: i7.id)
ri8 = RecipeIngredient.create(recipe_id:chicken.id, ingredient_id: i8.id)
ri9 = RecipeIngredient.create(recipe_id:tuna.id, ingredient_id: i9.id)
ri10 = RecipeIngredient.create(recipe_id:tuna.id, ingredient_id: i10.id)
ri11 = RecipeIngredient.create(recipe_id:tuna.id, ingredient_id: i11.id)
ri12 = RecipeIngredient.create(recipe_id:pasta.id, ingredient_id: i12.id)

