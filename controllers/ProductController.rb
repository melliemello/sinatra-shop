#encoding: utf-8
module ArtGarbage
  module Controllers
    class ProductController < BaseController
      get '/products' do
        @products = Models::Product.all
        erb :all, :layout => :default
      end

      get '/products/create' do
        @categories = Models::Category.all
        erb :create, :layout => :default
      end

      post '/products/create' do
        # allow_binding :title, :summary, :picture
        @page_title = 'Създай нов продукт'
        @product = Models::Product.new()

        picture = Models::Picture.new({file: params[:picture]}) if params[:picture]
        @product.pictures << picture if params[:picture]

        params[:categorys].each do |c| 
          category = Models::Category.find(c.to_i)
          @product.categorys << category
        end

        @product.title = params[:title]
        @product.summary = params[:summary]
        @product.price = params[:price]
        @product.save!
        redirect to'/' #how to divide routes from control
      end
    end
  end
end