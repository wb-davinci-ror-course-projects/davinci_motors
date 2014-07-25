# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.create! make: "Nissan", model: "Xtera", year: "2010", price: "12000"
Car.create! make: "Ford", model: "F150", year: "2001", price: "3000"
Car.create! make: "Toyota", model: "Tundra", year: "2010", price: "13000"
