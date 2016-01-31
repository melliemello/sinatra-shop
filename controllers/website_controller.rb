module ArtGarbage
  module Controllers
    class WebsiteController < BaseController
      get '/' do
        render_template "home"
      end
    end
  end
end