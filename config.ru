require 'sinatra/base'
require "sinatra/activerecord"

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

configure :development do
  set :database, {adapter: "sqlite3", database: "aga.sqlite3"}
end

map('/products') { run ProductController }
map('/') { run WebsiteController }

