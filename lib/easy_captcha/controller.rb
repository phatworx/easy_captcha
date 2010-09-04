module EasyCaptcha
  class Controller < ActionController::Base
    def captcha
      send_data generate_captcha, :disposition => 'inline', :type => 'image/png'
    end
  end
end