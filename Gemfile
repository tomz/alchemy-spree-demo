if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

gem 'rails', '3.2.15'
gem 'mysql2'

gem "alchemy_spree", github: 'magiclabs/alchemy_spree', branch: '0.2-stable'
gem "spree", github: 'tvdeyen/spree', branch: 'alchemy'
gem "alchemy_cms", github: 'magiclabs/alchemy_cms', branch: '2.7-stable'
gem 'money', '~> 5.1'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "zurb-foundation"
  gem 'compass-rails'
  gem 'turbo-sprockets-rails3'
end

group :development do
  gem 'quiet_assets'
  gem 'pry-rails'
  gem 'capistrano', '~> 2.15.5'
end
