class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock.values.sum
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    @stock.values.sum >= 23
  end
end
