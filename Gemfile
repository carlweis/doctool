source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 5.2.1"

gem "awesome_print"
gem "bootsnap", ">= 1.1.0", require: false
gem "carrierwave"
gem "devise"
gem "jbuilder", "~> 2.5"
gem "mini_magick", "~> 4.8"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "redis", "~> 4.0"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "webpacker"
gem "pry-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem "rspec-rails"
  gem "capybara"
  gem "factory_bot_rails"
  gem "shoulda-matchers"
  gem "spring-commands-rspec"
  gem "webmock"
end

group :development do
  gem "letter_opener"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
