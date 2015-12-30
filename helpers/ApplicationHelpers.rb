require 'sinatra/base'

module Sinatra
  module ApplicationHelpers
    def allow_binding(*attributes)
      #how do we get the app context here
      params.delete_if { |key, value| !attributes.include?(key.to_sym) }
    end

    def find_template(views, name, engine, &block)
      Array(views).each do |v|
        is_layout_view = v.include?('/layout')
        is_controller_view = v.include?(self.class.name.split('::').last.sub('Controller', '').downcase)
        
        if is_controller_view || is_layout_view then
          super(v, name, engine, &block)
        end 
      end
    end
  end

  helpers ApplicationHelpers 
end
