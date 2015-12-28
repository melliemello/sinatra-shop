class WebsiteController < BaseController
  get '/' do
    erb :home, :layout => :default
  end
end