# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'open-uri'
# require "nokogiri"

puts "let's seed the ingredients..."

Ingredient.delete_all

ingredients_list = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)

ingredients_list['drinks'].each do |element|
  Ingredient.create!(name: element['strIngredient1'])
end

puts "let's seed the cocktails..."

cocktail_title = Nokogiri::HTML(open('https://imgur.com/gallery/O5nh9').read)
cocktails_array = []
cocktail_title.search('.post-image-container').each do |element|
  cocktails_array << {
    name: element.search('.post-image-meta').search('.post-image-title').text.strip,
    description: element.search('.post-image-meta').search('.post-image-description').text.strip,
  }
end

Dose.delete_all
Cocktail.delete_all

cocktails_array.each do |cocktail|
  Cocktail.create!(
    name: cocktail[:name],
    description: cocktail[:description]
  )
end

puts 'Done!'
