source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'bootstrap-sass'
gem 'haml-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails', '5.0.5'
gem 'jquery-turbolinks'
gem 'activerecord-import'
gem 'jquery-datatables-rails'
gem 'ajax-datatables-rails'
gem 'font-awesome-rails'
gem 'chosen-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :test do
  gem 'guard'
  gem 'rubocop', require: false
  gem 'guard-rubocop'
  gem 'mocha', require: false
  gem 'rspec-rails', '~> 3.5.0'
  gem 'guard-rspec', require: false
  gem 'parallel_tests'
  gem 'database_cleaner'
  gem 'webmock'
  gem 'factory_bot_rails'
  gem 'json_expressions'
  gem 'simplecov', :require => false
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers', '~> 2.0'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
