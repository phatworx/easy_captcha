module EasyCaptcha
  module Generators #:nodoc:
    class InstallGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path("../../templates", __FILE__)

      desc "Install easy_captcha"

      def copy_initializer #:nodoc:
        template "easy_captcha.rb", "config/initializers/easy_captcha.rb"
      end

      def add_devise_routes #:nodoc:
        route 'captcha_route'
      end

      def add_after_filter #:nodoc:
        inject_into_class "app/controllers/application_controller.rb", ApplicationController do
          "  # reset captcha code after each request for security\n  after_filter :reset_last_captcha_code!\n\n"
        end
      end
    end
  end
end