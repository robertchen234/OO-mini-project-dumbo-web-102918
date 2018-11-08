class RecipeCard


attr_reader :user, :recipe, :date, :rating
@@all = []

def self.all
  @@all
end

  def initialize(user, recipe, date=0, rating=0)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
    user.recipes << recipe unless user.recipes.include?(recipe)
  end







end
