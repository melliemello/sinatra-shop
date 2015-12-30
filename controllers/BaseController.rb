# require './helpers/ApplicationHelpers'

module ArtGarbage
  module Controllers
    class BaseController < Sinatra::Base
      configure do
        set :root, ArtGarbage::App.settings.root
        set :views, ArtGarbage::App.settings.views
      end
      helpers Sinatra::ApplicationHelpers
      register Sinatra::ActiveRecordExtension
      set :database, {adapter: "sqlite3", database: "aga.sqlite3"}
    end
  end
end