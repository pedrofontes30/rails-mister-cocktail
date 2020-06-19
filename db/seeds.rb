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

cocktail_names = [['Gin and Tonic', 'https://getitmagazine.co.za/pretoria/wp-content/uploads/sites/26/2019/08/03ae4e695a513e5af0416bd9554ad8e6.jpg'],
                  ['Caipirinha', 'https://img.itdg.com.br/tdg/images/recipes/000/128/825/319875/319875_original.jpg?w=1200'],
                  ['Martini', 'https://abrilmdemulher.files.wordpress.com/2016/10/receita-dry-martini.jpg?quality=90&strip=info&w=620&h=372&crop=1'],
                  ['Pina Colada', 'https://assets.epicurious.com/photos/5b74642552990f2927bb2a14/master/pass/pina-colado-recipe-081518.jpg']]

cocktail_names.each do |name, url|
  file = URI.open(url)
  cocktail = Cocktail.new(name: name)
  cocktail.photo.attach(io: file, filename: "#{name.downcase.gsub(' ', '-')}.png", content_type: 'image/jpg')
  cocktail.save
end
