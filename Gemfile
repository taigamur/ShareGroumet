
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails',      '6.0.3'
gem 'mysql2'
gem 'aws-sdk-s3',              '1.46.0', require: false
gem 'mini_magick',                '4.9.5'
gem 'active_storage_validations', '0.8.2'
gem 'bcrypt',     '3.1.13'
gem 'faker',      '2.1.2'
gem 'will_paginate',           '3.1.8'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '3.4.1'
gem 'sassc', '2.1.0'
gem 'sass-rails', '6'
gem 'webpacker',  '5.0.0'
gem 'turbolinks', '5.2.0'
gem 'jbuilder',   '2.9.1'
gem 'bootsnap',   '1.4.5', require: false
#API_KEYを環境変数として管理する（Keyを外部流出させないための措置）
gem 'dotenv-rails'
#アプリケーション内でHTTPリクエストを投げたい場合に使うクラス
gem 'httpclient'

#add
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem "nokogiri", ">= 1.13.2"
gem "puma", ">= 4.3.11"
gem "image_processing", ">= 1.12.2"

group :development, :test do
  gem 'sqlite3', '1.4.1'
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
end


group :production do
end