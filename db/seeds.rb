# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.name = "user"
user.email = "user@user.com"
user.password = "123456"
user.confirmed_at = Time.now
user.save!

user2 = User.new
user2.name = "user2"
user2.email = "user2@user.com"
user2.password = "123456"
user2.confirmed_at = Time.now
user2.save!
