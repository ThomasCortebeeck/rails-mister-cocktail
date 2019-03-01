# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Ingredient.destroy_all
Cocktail.destroy_all # -> not necessary

puts 'Creating ingredients...'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)
# puts ingredients -> output
# puts ingredients.class -> hash
# # puts ingredients['drinks'] -> output
# # puts ingredients['drinks'].class -> array
ingredients['drinks'].each do |ingredient|
# puts ingredient
 i = Ingredient.create(name: ingredient['strIngredient1']) # hash (key/value) ingredient['strIngredient1']
 # intern = Intern.new(first_name: "Allison", last_name: "Cameron").save
 puts "create #{i.name}"
end


# results = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
# # puts results -> output
# # puts results.class -> hash
# # puts results['drinks'] -> output
# # puts results['drinks'].class -> array
# results['drinks'].each do |ingredient|
# 	puts ingredient
#   # Ingredient.new(name: ingredient["strIngredient1"]).save
# end
