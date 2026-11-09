source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in email_override.gemspec.
gemspec

group :development, :test do
  gem "rails", "~> 8.1.0"
  gem "rspec-rails", "~> 8.0"
  gem "rubocop-presets", git: "https://github.com/ddankel/rubocop-presets"
  gem "sprockets-rails"
  gem "sqlite3", "~> 2.1"
end

# To use a debugger
# gem 'byebug', group: [:development, :test]
