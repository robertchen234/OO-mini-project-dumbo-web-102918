class Recipe
attr_writer :ingredients
attr_reader :name

@@all = []

def self.all
  @@all
end

def initialize(name)
  @name = name
  @ingredients = []
  @@all << self
end

def recipe_cards
  RecipeCard.all.select{|card| card.recipe == self}
end

def users
  recipe_cards.map{|card| card.user }
end


def ingredients
  @ingredients = RecipeIngredient.all.select{|ri| ri.recipe == self}.map{|ri| ri.ingredient}
end


def self.most_popular

  pop = nil
  prev = 0

  all.each do |recipe|

     num = recipe.recipe_cards.length

     if num > prev
       pop = recipe
     end
     prev = num

   end

   pop
end





end
