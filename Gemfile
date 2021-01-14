# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false

gem 'devise'
gem 'name_of_person'
gem 'image_processing'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'friendly_id', '~> 5.4.0'
gem 'activerecord-session_store'
gem 'acts_as_list'
gem 'view_component', require: 'view_component/engine'
gem 'mjml-rails'
gem 'stimulus_reflex', '~> 3.3'
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap4'
gem 'cable_ready', '~> 4.3'
gem 'discard', '~> 1.2'
gem 'administrate'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'letter_opener'
  gem 'bullet'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'simplecov', require: false
  gem 'database_cleaner-active_record'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
