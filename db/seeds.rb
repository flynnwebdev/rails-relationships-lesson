# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.destroy_all
Author.destroy_all

Author.create!(
    first_name: "Stephen",
    last_name: "King"
).books.create!([
    { title: "IT" },
    { title: "The Shining" }
])
