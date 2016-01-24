module ArtGarbage
  module Controllers
    class PurchaseController < BaseController
      get '/purchase' do
        if cookies[:ag_card] then
          @user = current_user
          @line_items = JSON.parse(cookies[:ag_card])['products'];
          @products = Product.find(JSON.parse(cookies[:ag_card])['products'].keys);
          erb :shopping_card, :layout => :default
        end
      end

      post'/purchase/buy' do
        params[:user_id] = session[:id] if logged_in
        order = Models::Order.create(params)
        cookies.delete('ag_card')
        if order then
          redirect to '/products'
        else
          'failure'
        end
      end

      get '/purchase/all-orders' do
        required_admin
        @orders = Models::Order.all
        erb :all_orders, layout: :default
      end
    end
  end
end