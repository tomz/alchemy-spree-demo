if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
source 'https://rubygems.org'
ruby '2.1.2'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1.4'

gem 'alchemy_cms',              github: 'magiclabs/alchemy_cms',            branch: 'master'
gem 'alchemy-devise',           github: 'magiclabs/alchemy-devise',         branch: 'master'
gem 'alchemy-usermanual',       github: 'magiclabs/alchemy-usermanual',     branch: 'master'
gem 'rack-cache', :require => 'rack/cache'

gem "alchemy_spree", github: 'tomz/alchemy_spree', branch: 'master'
gem "spree", github: 'spree/spree', branch: 'master'
gem "spree_i18n", github: 'spree/spree_i18n', branch: 'master'
gem 'spree_fancy', :github => 'tomz/spree_fancy'
gem 'spree_gateway', github: 'spree/spree_gateway', branch: 'master'
gem 'spree_paypal_express', :github => "tomz/better_spree_paypal_express", branch: 'master'


#gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: 'master'
gem 'spree_elasticsearch', github: 'tomz/spree_elasticsearch', branch: 'master'

gem 'money'#, '~> 5.1'

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'compass-rails'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'#, '2.1.0'
gem "zurb-foundation"
#gem 'mysql2'
gem 'pg'
gem 'unicorn'

group :production do
  gem 'dragonfly-s3_data_store'
  gem 'rails_12factor'
  gem 'rack-cors'
end

group :development do
  gem 'capistrano', '~> 2.15'
  gem 'pry-rails'
  #gem 'sqlite3'
  # gem "rails-i18n-debug"
  gem 'quiet_assets'
end
