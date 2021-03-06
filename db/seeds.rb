# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

s1 = User.create({ id:1, provider: 'github', uid: 1, full_name: 'Alyssa P. Hacker', image: 'https://www.gravatar.com/avatar/00000000000010000001000000100000?s=230&d=identicon&f=y' })
s2 = User.create({ id:2, provider: 'github', uid: 2, full_name: 'J. Random User', image: 'https://www.gravatar.com/avatar/00006100008010000001000000100000?s=230&d=identicon&f=y' })
brigitte = User.create({ id:3, provider: 'fhsfull', uid: 3, full_name: 'Brigitte Jellinek', image: 'https://www.gravatar.com/avatar/240fded6e397da0150db90ce28b91ac0.jpg?s=230' })

u8 = Adventure.create({ owner: brigitte, prefix: 'u8', title: 'Testing for Stars', 
  description: 'Work through the example app to learn about testing in rails.'})

u8.stepstones.create([
  { sortorder: 0, description: 'install the app from https://github.com/backend-development/rails-example-testing-for-stars, start it on localhost,  and run the existing tests in the commandline with rails test'},
  { sortorder: 1, description: 'Write a test to check that a newly created user has a `no_stars` set to zero. This test should immediately pass, the default value was set correctly in the migration that created the users table' },
  { sortorder: 2, description: 'Write a new method in the user model: a method named `add_star!` that increases the number of stars by one. But: Write the test first. Make sure it fails, then implement the changes in the model and make sure the test passes now.'},
  { sortorder: 3, description: 'Find the file that already contains two feature tests. What do they test for? Which test uses JavaScript and which doesnt?'},
  { sortorder: 4, description: 'The javascript driver can save screenshots, and this feature is used once in the existing tests. Before you look at the screenshot: discuss what you expect it to show! Then find the screenshot and compare.'},
  { sortorder: 5, description: 'Try out the two lines that are commented out. When you first write tests for javascript it might be useful to look at the console to find problems with your tests.'}
])
