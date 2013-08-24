source 'https://rubygems.org'

gemspec

group :test, :development do
  gem 'wrong', :git => 'git@github.com:vyorkin/wrong.git'
  gem 'pre-commit'
  gem 'rubocop'
end

group :test do
  gem 'coveralls', :require => false
  gem 'simplecov', :require => false
end
