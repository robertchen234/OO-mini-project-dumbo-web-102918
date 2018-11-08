require_relative '../config/environment.rb'



user1 = User.new("Omar")
user2 = User.new("Rob")

recipe1 = Recipe.new("Recipe 1")
recipe2 = Recipe.new("Recipe 2")
recipe3 = Recipe.new("Recipe 3")
recipe4 = Recipe.new("Recipe 4")

date1 = "4/20/13"
date2 = "4/15/15"
date3 = "12/25/15"

card1 = RecipeCard.new(user1, recipe1, date1,4)
card2 = RecipeCard.new(user2, recipe2, date2, 5)
card3 = RecipeCard.new(user1, recipe2, date3,7)
# card4 = RecipeCard.new(user1, recipe1, nil, 4)
# card5 = RecipeCard.new(user1, recipe3, nil,10)
# card6 = RecipeCard.new(user1, recipe4, nil, 1)
cherry = Ingredient.new("cherry")
apple = Ingredient.new("apple")

ri1 = RecipeIngredient.new(cherry, recipe1)
ri2 = RecipeIngredient.new(cherry, recipe2)
ri3 = RecipeIngredient.new(apple, recipe1)

allergen1 = Allergen.new(apple,user1)
# allergen2 = Allergen.new(cherry,user1)
allergen3 = Allergen.new(cherry,user2)
# allergen4 = Allergen.new(apple,user2)

binding.pry
