class ProductController < BaseController
  get '/' do
    @products = Product.all
    erb :all, :layout => :default
  end

  get '/create' do
    erb :create, :layout => :default
  end

  post '/create' do
    allow_binding :title, :summary
    

    @product = Product.new(params)
    @product.save!
    redirect '/' #how to divide routes from control
  end
end 