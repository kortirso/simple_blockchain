source 'https://rubygems.org'

ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.5'

# Use postgresql as the database for Active Record
gem 'pg', '0.21'

# Use Puma as the app server
gem 'puma', '~> 3.10'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'foreman'
gem 'webpacker', '3.2.1'
gem 'webpacker-react', '~> 0.3.2'

# Store secrets
gem 'figaro'

# Use Slim as the templating engine. Better than ERB
gem 'slim'

# Code analyzation
gem 'rubocop', '~> 0.49.1', require: false

# Different
gem 'therubyracer', platforms: :ruby

# Background Jobs
gem 'sidekiq', '5.0.5'

# Model Serializers
gem 'active_model_serializers', '~> 0.10.0'
gem 'oj'
gem 'oj_mimic_json'

# Fast batch record creation
gem 'activerecord-import'

group :development, :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

group :development do
  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', '~> 1.3', require: false
  gem 'capistrano-rvm', require: false
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'json_spec'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
