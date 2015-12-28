require 'sinatra/base'
require "sinatra/activerecord"
require "sinatra/reloader"
require 'sass/plugin/rack'

Sass::Plugin.options[:style] = :compressed
Sass::Plugin.options[:template_location] = './public/scss'
Sass::Plugin.options[:css_location] = './public/css'
use Sass::Plugin::Rack

use Rack::Static, :urls => ['/scss', '/css', '/images'], :root => 'public'

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

BaseController.configure :development do
  BaseController.register Sinatra::Reloader
  BaseController.set :database, {adapter: "sqlite3", database: "aga.sqlite3"}
  BaseController.set :views, ["views/product", "views/website", "views/layout"]
  BaseController.set :static, true
end

[ProductController, WebsiteController].each do |controller|
  controller.also_reload '../controllers/*.rb'
end

map('/products') { run ProductController }
map('/') { run WebsiteController }

