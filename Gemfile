
source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc2', '< 5.1'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
# Use Uglifier as compressor for JavaScript images
gem 'uglifier', '>= 1.3.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use React for Rails
gem 'react-rails', '~> 1.7.0'
# Use Browserify for Rails
gem 'browserify-rails', '~> 3.1.0'
# Use Active Model Serializers
gem 'active_model_serializers', '~> 0.10.0'

gem 'brakeman', :require => false

group :production do
  gem 'rails_12factor'
  gem 'pg', '0.18.4'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'#, '~> 3.4.2'
  gem 'factory_girl_rails'
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'faker'
  gem 'json_spec', '~> 1.1', '>= 1.1.4'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'shoulda-kept-respond-with-content-type'
  gem 'watir', '~>4.0'
  gem 'watir-webdriver', '~> 0.9.1'
  gem 'page-object', '~> 1.1', '>= 1.1.1'
  gem 'require_all', '~> 1.3', '>= 1.3.3'
  gem 'database_cleaner'
  gem 'rspec_html_formatter', '~> 0.3.1'
end
