# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: "Jason", last_name: "Leibowitz", email: "jasonaleibowitz@gmail.com", dob: "1987-02-26", zipcode: "11201", admin: true, password: "sertgh67", password_confirmation: "sertgh67", profile_pic: "http://i.imgur.com/5z5NbX5.jpg", about: "I'm an aspiring web developer, Apple Geek, New Yorker, Jew & big soccer fan.")
