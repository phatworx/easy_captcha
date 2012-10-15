module EasyCaptcha
  # captcha controller
  class Controller < ActionController::Base
    # captcha action send the generated image to browser
    def captcha
      if params[:format] == "wav"
        send_data generate_speech_captcha, :disposition => 'inline', :type => 'audio/wav'
      else
        send_data generate_captcha, :disposition => 'inline', :type => 'image/png'
      end
    end
  end
end
