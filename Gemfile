source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

  
gem "config"
gem 'rails', '~> 5.2.0'
gem 'mysql2'
gem 'jquery-rails'
gem "figaro"
gem 'devise'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails_admin'
gem "cancancan"
gem 'mini_magick'
gem 'carrierwave'
gem 'ckeditor'
gem "cocoon"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'sqlite3', '~> 1.3.6'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger', '>= 0.1.1'
  gem 'capistrano-rails-collection'
  # Remove the following if your app does not use Rails
  gem 'capistrano-rails'
  gem 'capistrano-secrets-yml', '~> 1.1.0'
  gem 'capistrano-database-yml', '~> 1.0.0'
  # Remove the following if your server does not use RVM
  gem 'capistrano-rvm'
end

group :test do
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
