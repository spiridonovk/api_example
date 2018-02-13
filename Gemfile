
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 0.18'
gem 'uglifier',     '3.2.0'
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.7'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
end
group :test do
  gem 'factory_bot_rails', require: false
  gem 'rspec'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
