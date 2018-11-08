require "pry"

class User

  attr_writer :recipes
  attr_reader :name

  @@all = []

  def self.all
    @@all
  end


  def initialize(name)
    @name = name
    @recipes = []
    @@all << self
  end

  def recipes
    @recipes = RecipeCard.all.select{|card| card.user == self}.map{|card| card.recipe }
  end

  def add_recipe_card (recipe,date=0,rating=0)
    RecipeCard.new(self,recipe,date,rating)
  end

  def declare_allergen (ingredient)
    Allergen.new(ingredient,self)
  end

  def allergens
    Allergen.all.select{|al| al.user == self}
  end

  def top_three_recipes
    user_recipes = RecipeCard.all.select{|card| card.user == self}

    sorted = user_recipes.sort_by {|recipe| recipe.rating}.reverse
    sorted[0..2]

  end

  def most_recent_recipe
    user_recipes = RecipeCard.all.select{|card| card.user == self}
    recent = user_recipes[0]

    user_recipes.each do |card|
      date_array = card.date.split("/")

      if recent.date.split("/")[2].to_i < date_array[2].to_i
        recent = card
      elsif recent.date.split("/")[2].to_i == date_array[2].to_i
        if recent.date.split("/")[1].to_i < date_array[1].to_i
          recent = card
        elsif recent.date.split("/")[1].to_i == date_array[1].to_i
          if recent.date.split("/")[0].to_i < date_array[0].to_i
            recent = card
          end
        end
      end  #if end
    end # loop end
    recent.recipe
  end # method end


#   def safe_recipes
#     allergic_ings = allergens.map {|allergen| allergen.ingredient}
#     array = []
#
#       want = true
#
#       recipes.each do |recipe|
#         counter = 0
#         recipe.ingredients.each do |ing|
#
#         if ing == allergic_ings[counter]
#           want = false
#         end
#         counter += 1
#       end
#       if want
#         array << recipe
#       end
#     end
#
#
#
# array
#
#
#   end

end
