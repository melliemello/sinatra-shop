 #encoding: utf-8
module ArtGarbage
  module Controllers
    class ProductController < BaseController
      get '/products' do
        @products = Models::Product.all
        render_template 'all'
      end

      get '/products/create' do
        required_admin
        @page_title = 'Създай нов продукт'
        @categories = Models::Category.all
        render_template 'create'
      end

      post '/products/create' do
        required_admin
        # allow_binding :title, :summary, :picture
        if Product.create(params) then
          redirect to'/products/edit' 
        else
          'failed to create new product'
        end
      end

      get '/products/edit' do
        required_admin
        @page_title = 'Въведени продукти'
        @products = Product.all
        @categories = Category.all
        if @products then
          render_template 'edit_list'
        else
          'products not found'
        end
      end

      get '/products/edit/:id' do
        # required_admin
        @page_title = 'Редакция на продукт'
        @product = Product.find(params[:id])
        @categories = Category.all
        if @product then
          render_template 'edit'
        else
          'product not found'
        end
      end

      post '/products/edit/' do
        # required_admin
        # allow_binding :title, :summary, :picture
        product = Product.find(params[:id])
        product.categorys.clear
        product.update(params)
        if product then
          redirect to'/products/edit'
        else
          'product update failed'
        end
      end
    end
  end
end