# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Limpiando base de datos"
Character.destroy_all

puts "Base de datos limpia"

puts "Creando personajes"

10.times do |character|
  character = Character.create(
    name: Faker::Movies::HarryPotter.character,
    age: (5..45).to_a.sample,
    weight: [12.5, 10.4, 50.4, 33.3].sample,
    history: Faker::Movies::HarryPotter.quote,
  )
end

  puts "Personajes creados"