source 'https://rubygems.org'

ruby '2.2.0'

gem 'rails', 					'4.2.2'
gem 'sass-rails', 				'5.0.2'
gem 'haml'
gem 'uglifier', 				'2.5.3'
gem 'coffee-rails', 			'4.1.0'
gem 'jquery-rails',				'4.0.3'
gem 'turbolinks',				'2.3.0'
gem 'jbuilder', 				'2.2.3'
gem 'sdoc', 					'0.4.0', group: :doc
gem 'omniauth-bnet', 			'1.1.0'
gem 'figaro',					'1.1.1'
gem 'rack-ssl-enforcer'

group :production do
  gem 'rails_12factor', 		'0.0.2'
  gem 'pg',						'0.17.1'
end

group :development, :test do
  gem 'byebug',					'3.4.0'
  gem 'rspec-rails',			'3.3.3'
  gem 'factory_girl_rails',		'4.5.0'
  gem 'cucumber-rails',	require: false
  gem 'database_cleaner'
  gem 'gherkin', platforms: :ruby
  gem 'sqlite3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
