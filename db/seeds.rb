# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Limpiando base de datos"
Genre.destroy_all

puts "Base de datos limpia"

puts "Creando géneros"

aventuras_photo = URI.open('https://cdn.pixabay.com/photo/2019/05/12/16/04/genie-4198396_960_720.jpg')
drama_photo = URI.open('https://cdn.pixabay.com/photo/2014/10/22/18/13/donald-duck-498512_960_720.jpg')
princesas_photo = URI.open('https://cdn.pixabay.com/photo/2015/09/29/12/53/beautiful-963893_960_720.jpg')
pixar_photo = URI.open('https://cdn.pixabay.com/photo/2020/08/20/21/02/toys-5504700_960_720.jpg')
clasicos_photo = URI.open('https://cdn.pixabay.com/photo/2016/11/01/13/20/fairy-tale-1788212_960_720.jpg')

aventuras = Genre.create(name: "Aventuras")
drama = Genre.create(name: "Drama")
princesas = Genre.create(name: "Princesas")
pixar = Genre.create(name: "Pixar")
clasicos = Genre.create(name: "Clásicos")

aventuras.photo.attach(io: aventuras_photo, filename: 'avent.png', content_type: 'image/png')
drama.photo.attach(io: drama_photo, filename: 'drama.png', content_type: 'image/png')
princesas.photo.attach(io: princesas_photo, filename: 'prin.png', content_type: 'image/png')
pixar.photo.attach(io: pixar_photo, filename: 'pixar.png', content_type: 'image/png')
clasicos.photo.attach(io: clasicos_photo, filename: 'clasic.png', content_type: 'image/png')


puts "Géneros creados"