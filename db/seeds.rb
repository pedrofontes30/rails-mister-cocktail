# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all

serialized_drinks = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read

JSON.parse(serialized_drinks)['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

Cocktail.create(name: 'Apple Martini')
Cocktail.create(name: 'Cuba Libre')
Cocktail.create(name: 'Sex on the beach')
Cocktail.create(name: 'Gin and Tonic')
Cocktail.create(name: 'Caipirinha')
