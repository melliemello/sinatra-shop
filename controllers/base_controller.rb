#encoding: utf-8
module ArtGarbage
  module Controllers
    class BaseController < Sinatra::Base
      configure do
        set :root, ArtGarbage::App.settings.root
        set :views, ArtGarbage::App.settings.views
        set :base_url, ArtGarbage::App.settings.base_url
        set :errors, []
      end

      helpers Sinatra::ApplicationHelpers
      helpers Sinatra::SessionHelper
      helpers Sinatra::Cookies
      register Sinatra::ActiveRecordExtension
      register Sinatra::Flash
      enable :sessions

      set :database, {adapter: "sqlite3", database: "aga.sqlite3"}

      use Sass::Plugin::Rack
      Sass::Plugin.options[:style] = :compressed
      Sass::Plugin.options[:template_location] = ArtGarbage::App.settings.public_path + '/scss'
      Sass::Plugin.options[:css_location] = ArtGarbage::App.settings.public_path + '/css'
    end
  end
end