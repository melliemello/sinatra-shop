module ArtGarbage
  module Models
    class Mail
      def initialize(context)
        @context = context
      end

      def deliver(mail_options)
        receiver = mail_options[:receiver]
        subject = mail_options[:subject]
        Encoding.default_external = "UTF-8"
        template = File.read("#{APP_ROOT}/views/email/#{mail_options[:template]}.erb")


        html_body  = ERB.new(template).result(@context)

        Pony.mail(to: receiver, subject: subject, html_body: html_body)
      end
    end
  end
end