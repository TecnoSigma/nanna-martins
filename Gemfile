# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'carmen'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'i18n'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.1'
gem 'rails-observers'
gem 'sass-rails', '~> 5.0'
gem 'settingslogic'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'watir'

group :development, :test do
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
  gem 'rubycritic', require: false
  gem 'should_not'
  gem 'sidekiq'
  gem 'simplecov-cobertura'
  gem 'simplecov-rcov'
end

group :development do
  gem 'brakeman'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails-erd'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
