module ArtGarbage
  module Models
    class PurchaseProcess
      attr_reader :order

      def initialize(context) 
        @context = context
        @order = Order.create(context.params)
        @mailer = Mail.new(binding)
      end

      def notify_admin
        mail_options = {
          receiver: 'drenskam@gmail.com',
          subject: 'Art Garbage Atelier - purchase confirmation',
          template: 'order_confirmation'
        }
        @mailer.send mail_options
      end

      def notify_customer
        mail_options = {
          receiver: 'drenskam@gmail.com',
          subject: 'Art Garbage Atelier - new order',
          template: 'admin_new_order_notification'
        }
        @mailer.send mail_options
      end

      def clear_shopping_card
        @context.instance_eval do
          cookies.delete('ag_card')
        end
      end
    end
  end
end