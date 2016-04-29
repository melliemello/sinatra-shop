APP_ROOT = File.dirname(__FILE__)
require 'sinatra/base'
require "sinatra/activerecord"
require "sinatra/cookies"
require "sinatra/reloader"
require 'sass/plugin/rack'
require 'json'
require 'carrierwave'
require 'pony'
require 'carrierwave/orm/activerecord'
require 'bcrypt'
require "#{APP_ROOT}/app_config"
require "#{APP_ROOT}/controllers/controllers"
require "#{APP_ROOT}/models/models"

#configure db
RACK_ENV ||= ENV["RACK_ENV"] || "development"
dbconfig = YAML.load(ERB.new(File.read("config/database.yml")).result)
ActiveRecord::Base.establish_connection dbconfig[RACK_ENV]

Dir.glob("#{APP_ROOT}/library/**/*.rb").each { |file| require file }

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
      set :static, true

      set :email_options, {
        :via => :smtp,
        :from => 'art.garbage.atelier@gmail.com',
        :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => MAIL_CONFIG[:sender_username],
          :password             => MAIL_CONFIG[:sender_password],
          :authentication       => :plain, 
          :domain               => "localhost.localdomain" 
        }
      }

      Pony.options = settings.email_options
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



