source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
  gem "therubyracer"
  gem "less-rails"
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano

# To use debugger
# gem 'debugger'

gem "sidekiq"
gem "nokogiri"
gem "pry-rails"
gem "slim-rails"
gem "clockwork", :require => false

group :development, :test do
  gem "rspec-rails"
  gem 'sqlite3'
  gem 'capistrano', :require => false
  gem 'capistrano-unicorn', :require => false
end

group :production do
  gem "mysql2"
end
