require 'sinatra/base'
require "sinatra/activerecord"
require "sinatra/reloader"
require 'sass/plugin/rack'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

Dir.glob('./helpers/uploaders/*.rb').each { |file| require file }
Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

BaseController.configure :development do
  BaseController.set :database, {adapter: "sqlite3", database: "aga.sqlite3"}
end
