# encoding utf-8
module ArtGarbage
  module Controllers
    class PurchaseController < BaseController
      get '/purchase' do
        if cookies[:ag_card] then
          @user = current_user
          @line_items = JSON.parse(cookies[:ag_card])['products'];
          @products = Models::Product.find(JSON.parse(cookies[:ag_card])['products'].keys);
          render_template 'shopping_card'
        end
      end

      post'/purchase/buy' do
        params[:user_id] = session[:id] if logged_in
        @mailer = Models::Mail.new(binding)
        @order = Order.create(params)

        client_mail = {
          receiver: 'drenskam@gmail.com',
          subject: 'Art Garbage Atelier - purchase confirmation',
          template: 'order_confirmation'
        }

        admin_mail = {
          receiver: 'drenskam@gmail.com',
          subject: 'Art Garbage Atelier - new order',
          template: 'admin_new_order_notification'
        }

        if @order then
          @mailer.deliver admin_mail
          @mailer.deliver client_mail
          cookies.delete('ag_card')
          redirect to '/products'
        else
          'failure'
        end
      end

      get '/purchase/all-orders' do
        required_admin
        @orders = Models::Order.all
        render_template 'all_orders'
      end
    end
  end
end