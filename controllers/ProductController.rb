#encoding: utf-8 
class ProductController < BaseController
  get '/' do
    @products = Product.all
    erb :all, :layout => :default
  end

  get '/create' do
    @categories = Category.all
    erb :create, :layout => :default
  end

  post '/create' do
    # allow_binding :title, :summary, :picture
    @page_title = 'Създай нов продукт'
    @product = Product.new()

    picture = Picture.new({file: params[:picture]}) if params[:picture]
    @product.pictures << picture if params[:picture]

    params[:categorys].each do |c| 
      category = Category.find(c.to_i)
      @product.categorys << category
    end

    @product.title = params[:title]
    @product.summary = params[:summary]
    @product.price = params[:price]
    @product.save!
    redirect to'/' #how to divide routes from control
  end
end 