module ArtGarbage
  module Controllers
    class PurchaseController < BaseController
      get '/purchase' do
        @user = current_user
        @buyings = JSON.parse(cookies[:ag_card])['products'];
        @products = Product.find(JSON.parse(cookies[:ag_card])['products'].keys);
        erb :shopping_card, :layout => :default
      end

      post'/purchase/buy' do
        order = Models::Order.create(params)

        if order then
          order.id.to_s
        else
          'failure'
        end
      end
    end
  end
end