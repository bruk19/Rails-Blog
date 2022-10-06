# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(Name: 'Bruk', email: 'brukteshome21@gmail.com', 
    password: 'abcde', Photo: 'sese.png', Bio: 'Web developer.')
second_user = User.create(Name: 'Victor', email: 'abrish1222@gmail.com',
     password: '12345', Photo: 'sodome.png', Bio: 'Student from Ethiopia.')