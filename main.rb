require 'sinatra/base'
require "sinatra/activerecord"
require "sinatra/cookies"
require "sinatra/reloader"
require 'sass/plugin/rack'
require 'json'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'bcrypt'
require './controllers/controllers'
require './models/models'


Dir.glob('./helpers/uploaders/*.rb').each { |file| require file }
Dir.glob('./helpers/services/*.rb').each { |file| require file }
Dir.glob('./helpers/extensions/*.rb').each { |file| require file }

#configure picture uploads
CarrierWave.configure do |config|
    config.root = './public/'
end




module ArtGarbage
  class App < Sinatra::Base
    configure  do
      register Sinatra::Reloader
      set :root, Dir.pwd
      set :public_path, Dir.pwd + '/public'
      set :database, {adapter: "sqlite3", database: "aga.sqlite3"}
      set :views, [
        "#{settings.root}/views/layout",
        "#{settings.root}/views/product",
        "#{settings.root}/views/website",
        "#{settings.root}/views/user",
        "#{settings.root}/views/purchase"]
      set :static, true
    end

    use Controllers::BaseController
    use Controllers::ProductController
    use Controllers::WebsiteController
    use Controllers::UserController
    use Controllers::PurchaseController

    use Rack::Static, :urls => ['/scss', '/css', '/images', '/product_images', '/components', '/js'], :root => 'public'

    helpers Sinatra::ApplicationHelpers
    # register Sinatra::ActiveRecordExtension
  end
end

include ArtGarbage::Models



