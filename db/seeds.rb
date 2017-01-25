# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


brigitte = User.create({ provider: 'fhsfull', uid: 3, full_name: 'Brigitte Jellinek' })
s1 = User.create({ id:1, provider: 'fhsfull', uid: 1, full_name: 'Dummy Eins'  })
s2 = User.create({ id:2, provider: 'fhsfull', uid: 2, full_name: 'Dummy Zwei' })


Status.create([ { status: 'not started', sortorder: 1 },
                { status: 'working', sortorder: 2 },
                { status: 'blocked', sortorder: 3  },
                { status: 'finished', sortorder: 4  },
                { status: 'failed', sortorder: 5  }
]);

u8 = brigitte.adventure.create({ title: 'u8 - testing for stars', 
  description: 'work through the example app to learn about testing in rails'})

u8.stepstones.create([
  { sortorder: 1, titel: 'install the app from https://github.com/backend-development/rails-example-testing-for-stars, start it on localhost,  and run the existing tests in the commandline with rails test'},
  { sortorder: 2, titel: 'Write a test to check that a newly created user has a `no_stars` set to zero. This test should immediately pass, the default value was set correctly in the migration that created the users table' },
  { sortorder: 3, title: 'Write a new method in the user model: a method named `add_star!` that increases the number of stars by one. But: Write the test first. Make sure it fails, then implement the changes in the model and make sure the test passes now.'},
  { sortorder: 4, title: 'Find the file that already contains two feature tests. What do they test for? Which test uses JavaScript and which doesnt?'},
  { sortorder: 5, title: 'The javascript driver can save screenshots, and this feature is used once in the existing tests. Before you look at the screenshot: discuss what you expect it to show! Then find the screenshot and compare.'},
  { sortorder: 6, title: 'Try out the two lines that are commented out. When you first write tests for javascript it might be useful to look at the console to find problems with your tests.'}
])
