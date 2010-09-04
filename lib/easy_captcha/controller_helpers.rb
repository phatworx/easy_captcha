module EasyCaptcha
  # helper class for ActionController
  module ControllerHelpers
    
    def self.included(base) #:nodoc:
      base.class_eval do
        helper_method :valid_captcha?
      end
    end

    # generate captcha image and return it as blob
    def generate_captcha
      Captcha.new(generate_captcha_code).image
    end

    # generate captcha code, save in session and return
    def generate_captcha_code
      session[:captcha] = EasyCaptcha.length.times.collect { EasyCaptcha.chars[rand(EasyCaptcha.chars.size)] }.join
    end

    # validate given captcha code
    def valid_captcha?(code)
      session[:captcha].to_s.upcase == code.to_s.upcase
    end
    
  end
end