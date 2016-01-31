require 'sinatra/base'

module Sinatra
  module ApplicationHelpers
    def allow_binding(*attributes)
      params.delete_if { |key, value| !attributes.include?(key.to_sym) }
    end

    def render_template(template_name, layout: "default")
      if File.exist?("#{APP_ROOT}/views/layout/#{template_name}.erb") then
        erb :"layout/#{template_name}"
      else
        folder_name = self.class.name.split('::').last.sub('Controller', '').downcase
        erb :"#{folder_name}/#{template_name}", :layout => :"layout/#{layout}"
      end
    end
  end

  helpers ApplicationHelpers 
end
