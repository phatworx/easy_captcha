module EasyCaptcha
  module ControllerHelpers
    def self.included(base)
      base.class_eval do
        helper_method :valid_captcha?
      end
    end
    
    def generate_captcha
      Captcha.new(generate_captcha_code).image
    end
    
    def generate_captcha_code
      session[:captcha] = EasyCaptcha.length.times.collect { EasyCaptcha.chars[rand(EasyCaptcha.chars.size)] }.join
    end

    def valid_captcha?(code)
      session[:captcha].to_s.upcase == code.to_s.upcase
    end
  end
end