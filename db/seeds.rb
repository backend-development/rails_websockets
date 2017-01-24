# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

brigitte = User.create({ provider: 'fhsfull', uid: 3 })

u8 = brigitte.adventure.create({ title: 'u8 - testing for stars', 
  description: 'work through the example app to learn about testing in rails'})

u8.stepstones.create({
  titel: 'install the app from https://github.com/backend-development/rails-example-testing-for-stars, start it on localhost,  and run the existing tests in the commandline with `rails test`'
})
u8.stepstones.create({
  titel: 'install the app from https://github.com/backend-development/rails-example-testing-for-stars, start it on localhost,  and run the existing tests in the commandline with `rails test`'
})
