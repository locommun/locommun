source 'http://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


platforms :ruby do
  gem 'therubyracer'
  gem 'sqlite3'
  group :production do
    gem 'mysql2'
    gem  'passenger'
  end
  gem "wkhtmltopdf-binary", "~> 0.9.9.1"
  unless ENV["CI"]
    gem 'debugger', :group => [:development, :test]
  end
end

group :development do
  gem 'capistrano-unicorn'
   gem 'better_errors'
  gem 'binding_of_caller'
    # HAML Conversion tools
  gem "erb2haml"
  gem "html2haml"
end

group :development, :test do
  gem "rspec-rails", "~> 2.12"
end

group :test do
  gem "shoulda-matchers"
  gem 'factory_girl'
  gem 'simplecov', :require => false
  gem 'capybara'
  gem 'faker'
  gem 'ZenTest'
end

# capistrano
gem 'capistrano'
gem 'rvm-capistrano'

#Blog
gem "blogit"

# Gmaps4Rails
gem 'gmaps4rails'

#geocoder
gem 'geocoder'

# Devise
gem 'devise'

#Pagination
gem 'bootstrap-will_paginate'

#ActiveAdmin

gem 'rails_admin'

#Formtastic
gem 'formtastic'

#Haml
gem 'haml'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem "font-awesome-rails"
  gem "formtastic-plus-bootstrap"
  gem "formtastic-plus-flatui"
  gem "flatui-rails"
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

#Controller
gem 'inherited_resources'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'


#Google Places API
gem 'google_places'