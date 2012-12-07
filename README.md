stepstones
==========

keep an overview of where you students/teams are at in their exercises.


As a teacher:

1. define an "adventure"
2. consisting of several "steps"
3. publish


As a student:

1. join an "adventure"
2. work through the steps
3. mark a step as "done" or "skipped" 

As a teacher:

see where your students/teams are at



develop + deploy
-------------

to run your own server you need to
- clone https://github.com/bjelline/stepstones
- create a config/database.yml 
- create a config/initializers/secret_token.rb

to deploy with capistrano: the Capfile tries to link to files:
- database.yml to shared/config/database.yml
- secret_token.rb to shared/config/initializers/secret_token.rb
you have to create those two files by hand!
