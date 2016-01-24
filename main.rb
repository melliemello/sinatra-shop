APP_ROOT = File.dirname(__FILE__)
require 'sinatra/base'
require "sinatra/activerecord"
require "sinatra/cookies"
require "sinatra/reloader"
require 'sass/plugin/rack'
require 'json'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'bcrypt'
require "#{APP_ROOT}/controllers/controllers"
require "#{APP_ROOT}/models/models"

Dir.glob("#{APP_ROOT}/helpers/**/*.rb").each { |file| require file }

#configure picture uploads
CarrierWave.configure do |config|
  config.root = "#{APP_ROOT}/public/"
end

module ArtGarbage
  class App < Sinatra::Base
    configure  do
      register Sinatra::Reloader
      set :root, APP_ROOT
      set :public_path, APP_ROOT + '/public'
      set :database, {adapter: "sqlite3", database: "aga.sqlite3"}
      set :views, [
        "#{APP_ROOT}/views/layout",
        "#{APP_ROOT}/views/product",
        "#{APP_ROOT}/views/website",
        "#{APP_ROOT}/views/user",
        "#{APP_ROOT}/views/purchase"]
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



