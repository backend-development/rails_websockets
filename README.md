## Stepstones

a ruby on rails 5 example app to learn about websockets.

You can find a demo app at https://stepstones.herokuapp.com/

### Getting started

clone this repository, then

    bundle   
    rake db:migrate
    rake db:seed
    rails server

now point your browser at the homepage at http://localhost:3000/

To run the tests

    rails test


### What to do

1. set up activecable
2. create a channel
3. broadcast changes to status to all users in an adventure