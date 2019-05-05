source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
# Use postgresql
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Admin dashboard
gem 'execjs'
gem 'rails_admin'
gem 'therubyracer'

# Trailblazer for operations
gem 'trailblazer-rails'

# Queue system with cron
gem 'sidekiq'
gem 'sidekiq-cron'

gem 'colorize'

# JSON Serialization
gem 'blueprinter'

gem 'sentry-raven'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# Create and validate JWT for request headers
gem 'jwt_sessions'

group :development, :test do
  gem 'awesome_print'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  gem 'pry-byebug'

  # RSpec
  gem 'factory_bot_rails'
  gem 'json-schema'
  gem 'mutant-rspec'
  gem 'rspec-its'
  gem 'rspec-rails'
  gem 'shoulda-matchers'

  # Code coverage
  gem 'simplecov'
  gem 'simplecov-console'

  # ruby syntax analyze
  gem 'rubocop', require: false
  gem 'rubocop-checkstyle_formatter', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'mina'
end
