source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'devise'
gem 'simple_form'
gem 'cancan'
gem 'active_model_serializers'
gem 'gon'
gem 'js-routes'
gem 'draper'
gem 'virtus', '~> 1.0.0'
gem 'rest-client'
gem 'will_paginate', '~> 3.0'

gem 'nada', git: "https://github.com/BlinkerGit/nada.git"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass', '~> 3.0.3.0'

gem 'turbolinks'
gem 'jquery-rails'

group :assets do
  gem 'coffee-rails', '~> 4.0.0'
  gem 'eco'
  gem "compass-rails"

  gem 'uglifier', '>= 1.3.0'
end

group :development do
  gem 'thin'
end

group :development, :test do
  gem 'capybara'
  gem 'rspec-rails'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'rb-fsevent', '~> 0.9'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
end

group :test do
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'codeclimate-test-reporter', require: nil
end

group :production do
  gem 'unicorn'
  gem 'rails_12factor'  #for heroku
end


