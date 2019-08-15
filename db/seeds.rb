# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  name = "a#{n+1}"
  email = "a#{n+1}@a.a"
  password = "123123"
  avatar = "https://www.gravatar.com/avatar/#{n}?d=monsterid"
  User.create! name: name,
               email: email,
               password: password,
               confirmed_at: Time.zone.now,
               avatar: avatar
end

10.times do |n|
  name = "Room #{n+1}"
  r = Room.create! name: name,
                description: "this is room #{n+1}"
  10.times do |n|
    if n < 4
      r.administrators << User.find(n+1)
    end
    r.users << User.find(n+1)
  end
end