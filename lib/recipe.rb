class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(name, amount)
    @ingredients_required[name] = amount
  end

  def amount_required(name)
    @ingredients_required.values.sum
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    total = 0
    @ingredients_required.each do |required|
      total += required.first.calories * required.last
    end
    total
  end
end
