module ActionDispatch #:nodoc:
  module Routing #:nodoc:
    class Mapper #:nodoc:
      # call to add default captcha root
      def captcha_route
        match 'captcha' => 'easy_captcha/captcha#captcha', :via => :get
      end
    end
  end
end