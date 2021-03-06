source 'https://rubygems.org'

ruby '2.3.3'

# ensure https is used
# http://stackoverflow.com/questions/41454333/meaning-of-new-block-git-sourcegithub-in-gemfile#answer-41533565
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'

# ----------------- database ----------------
# Use postgres as the database for Active Record
gem 'pg'
gem 'aasm'

# ----------------- webserver ----------------
# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'redcarpet'

# ----------------- views -------------------------
gem 'record_tag_helper'

# ----------------- asset pipeline ----------------
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'inline_svg'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'

# ------------------- authentication ----------
# read secrets from .env file
gem 'dotenv-rails', :groups => [:development, :test]
gem 'omniauth'
gem 'omniauth-oauth2', '~> 1.3.1'
gem 'omniauth-github'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# ----------------- debug and test ----------------
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :test do
  gem 'minitest-rails-capybara'
  gem 'capybara-webkit'
  gem 'rails-controller-testing'
  gem 'transactional_capybara'
  gem 'm'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # live reload
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'rack-livereload'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
