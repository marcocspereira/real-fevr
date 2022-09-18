source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis"

# Simple, efficient background processing for Ruby
gem 'sidekiq'

# Is an extension to Sidekiq that pushes jobs in a scheduled way, mimicking cron utility.
gem 'sidekiq-scheduler'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Json Web Token (JWT) for token based authentication
gem 'jwt'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Authorization checks
gem 'pundit'

# Makes http fun again! Ain't no party like a httparty, because a httparty don't stop.
gem 'httparty'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'brakeman'

  # test framework
  gem 'rspec-rails'
  gem 'rspec-core'

  # code verification
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'annotate'
end

group :test do
  # instantiate and persist models
  gem 'factory_bot_rails'

  # custom expectations for rails helpers/macros
  gem 'shoulda-matchers'

  # library for generating fake data. We'll use this to generate test data
  gem 'faker'

  # strategies for cleaning up the database in between test runs
  gem 'database_cleaner'

  # a set of RSpec matchers for testing Pundit authorisation policies
  gem 'pundit-matchers'

  # generate coverage reports for tests
  gem 'simplecov'

  
end

