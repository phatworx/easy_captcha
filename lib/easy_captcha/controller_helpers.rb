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
      if EasyCaptcha.cache
        FileUtils.mkdir_p(EasyCaptcha.cache_temp_dir)
        files = Dir.glob(EasyCaptcha.cache_temp_dir + "*")
        unless files.size < EasyCaptcha.cache_size
          file = File.open(files.at(Kernel.rand(files.size)))

          if file.mtime < EasyCaptcha.cache_expire.ago
            File.unlink(file.path)
          else
            return file.readlines.join
          end
        end
        generated_code = generate_captcha_code
        Captcha.new(generated_code, EasyCaptcha.cache_temp_dir + "#{generated_code}").image
      else
        Captcha.new(generate_captcha_code).image
      end
    end

    # generate captcha code, save in session and return
    def generate_captcha_code
      session[:captcha] = EasyCaptcha.length.times.collect { EasyCaptcha.chars[rand(EasyCaptcha.chars.size)] }.join
    end

    # validate given captcha code and re
    def valid_captcha?(code)
      return false if session[:captcha].blank? or code.blank?
      session[:captcha].to_s.upcase == code.to_s.upcase
    end

  end
end
