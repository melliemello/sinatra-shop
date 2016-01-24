 #encoding: utf-8
module ArtGarbage
  module Controllers
    class ProductController < BaseController
      helpers Sinatra::ProductHelper

      get '/products' do
        @products = Models::Product.all
        erb :all, :layout => :default # how to setup layout foldre for all controllers
      end

      get '/products/create' do
        required_admin
        @page_title = 'Създай нов продукт'
        @categories = Models::Category.all
        erb :create, :layout => :default
      end

      post '/products/create' do
        required_admin
        # allow_binding :title, :summary, :picture
        if create_product(params) then
          redirect to'/products/edit' 
        else
          'failed to create new product'
        end
      end

      get '/products/edit' do
        required_admin
        @page_title = 'Въведени продукти'
        @products = all_products
        @categories = Category.all
        if @products then
          erb :edit_list, layout: :default
        else
          'products not found'
        end
      end

      get '/products/edit/:id' do
        # required_admin
        @page_title = 'Редакция на продукт'
        @product = find_product(params[:id])
        @categories = Category.all
        if @product then
          erb :edit, layout: :default
        else
          'product not found'
        end
      end

      post '/products/edit/' do
        # required_admin
        # allow_binding :title, :summary, :picture
        if update_product(params) then
          redirect to'/products/edit'
        else
          'product update failed'
        end
      end
    end
  end
end