module EasyCaptcha
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates an initializer and add a route"

      def copy_initializer
        template "easy_captcha.rb", "config/initializers/easy_captcha.rb"
      end

      def add_devise_routes
        route 'match "captcha" => EasyCaptcha::Controller, :via => :get'
      end
    end
  end
end