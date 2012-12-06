require "bundler/capistrano"
set :application, "stepstones"
set :scm, :git
set :repository,  "git@github.com:bjelline/stepstones.git" # use your own fork of the repo here
set :deploy_to, "/var/www/virthosts/stepstones"            # folder on your server
set :user, "deploy_stepstones"                             # user to log in on your server
set :branch, "master"                                      # which branch should be deployed
default_run_options[:pty] = true
set :use_sudo, false
set :port, 22                                # ssh port on your server
role :web, "your.host.com"                   # Your HTTP server, Apache/etc
role :app, "your.host.com"                   # This may be the same as your `Web` server
role :db,  "your.host.com", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
