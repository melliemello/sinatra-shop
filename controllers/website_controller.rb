module ArtGarbage
  module Controllers
    class WebsiteController < BaseController
      get '/' do
        erb :home, :layout => :default
      end
    end
  end
end