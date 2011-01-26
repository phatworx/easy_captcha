module ActionDispatch::Routing
  class Mapper #:nodoc:
    def captcha_route
      match "captcha" => EasyCaptcha::Controller, :via => :get
    end
  end
end