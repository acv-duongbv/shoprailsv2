source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'factory_bot_rails'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'will_paginate', '>= 3.0'
gem 'rails-controller-testing'
gem 'stringex', '~> 2.6'
gem 'rails_admin', '~> 1.3'
gem 'webhoseio-ruby', '~> 1.0'
gem 'rails', '~> 5.2.0'
gem 'slim'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'devise'
gem 'pg', '>= 0.18', '< 2.0'
gem 'simple_form'
gem 'puma', '~> 3.11'
gem 'uglifier', '>= 1.3.0'
gem 'cobravsmongoose', '~> 0.0.2'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'shoulda-matchers', '~> 3.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
