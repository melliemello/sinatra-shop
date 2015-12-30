require 'sinatra/base'
require "sinatra/activerecord"
require "sinatra/reloader"
require 'sass/plugin/rack'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require './helpers/ApplicationHelpers' 
require './controllers/controllers'
require './models/models'


Dir.glob('./helpers/uploaders/*.rb').each { |file| require file }
Dir.glob('./{helpers}/*.rb').each { |file| require file }

#configure picture uploads
CarrierWave.configure do |config|
    config.root = './public/'
end

Sass::Plugin.options[:style] = :compressed
Sass::Plugin.options[:template_location] = './public/scss'
Sass::Plugin.options[:css_location] = './public/css'


module ArtGarbage
  class App < Sinatra::Base
    configure  do
      register Sinatra::Reloader
      set :root, Dir.pwd
      set :database, {adapter: "sqlite3", database: "aga.sqlite3"}
      set :views, ["#{settings.root}/views/layout","#{settings.root}/views/product","#{settings.root}/views/website", ]
      set :static, true
    end

    use Controllers::BaseController
    use Controllers::ProductController
    use Controllers::WebsiteController

    use Sass::Plugin::Rack
    use Rack::Static, :urls => ['/scss', '/css', '/images', '/product_images', '/components', '/js'], :root => 'public'

    helpers Sinatra::ApplicationHelpers
    # register Sinatra::ActiveRecordExtension
  end
end

include ArtGarbage::Models



