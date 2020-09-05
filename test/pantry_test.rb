require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test
  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_starts_with_empty_stock
    pantry = Pantry.new
    ingredient1 = Ingredient.new("Cheese", "C", 50)
    ingredient2 = Ingredient.new("Macaroni", "oz", 200)
    recipe = Recipe.new("Mac and Cheese")

    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)

    assert_equal ({}), pantry.stock
  end

  def test_check_stock
    pantry = Pantry.new
    ingredient1 = Ingredient.new("Cheese", "C", 50)
    ingredient2 = Ingredient.new("Macaroni", "oz", 200)
    recipe = Recipe.new("Mac and Cheese")

    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)

    assert_equal 0, pantry.stock_check(ingredient1)
  end

  def test_restock
    pantry = Pantry.new
    ingredient1 = Ingredient.new("Cheese", "C", 50)
    ingredient2 = Ingredient.new("Macaroni", "oz", 200)
    recipe = Recipe.new("Mac and Cheese")

    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)

    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)

    assert_equal 15, pantry.stock_check(ingredient1)
  end

  def test_enough_for_recipe
    pantry = Pantry.new
    ingredient1 = Ingredient.new("Cheese", "C", 50)
    ingredient2 = Ingredient.new("Macaroni", "oz", 200)
    recipe = Recipe.new("Mac and Cheese")

    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)

    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)

    assert_equal false, pantry.enough_ingredients_for?(recipe)

    pantry.restock(ingredient2, 7)

    assert_equal false, pantry.enough_ingredients_for?(recipe)

    pantry.restock(ingredient2, 1)

    assert_equal true, pantry.enough_ingredients_for?(recipe)
  end
end
