module EasyCaptcha
  # captcha controller
  #   match "captcha" => EasyCaptcha::Controller
  class Controller < ActionController::Base
    # captcha action send the generated image to browser
    def captcha
      send_data generate_captcha, :disposition => 'inline', :type => 'image/png'
    end
  end
end