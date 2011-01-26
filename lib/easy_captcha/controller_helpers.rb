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
        # create cache dir
        FileUtils.mkdir_p(EasyCaptcha.cache_temp_dir)

        # select all generated captchas from cache
        files = Dir.glob(EasyCaptcha.cache_temp_dir + "*")
        
        unless files.size < EasyCaptcha.cache_size
          file              = File.open(files.at(Kernel.rand(files.size)))
          session[:captcha] = File.basename(file.path)

          if file.mtime < EasyCaptcha.cache_expire.ago
            File.unlink(file.path)
          else
            return file.readlines.join
          end
        end
        generated_code = generate_captcha_code
        image = Captcha.new(generated_code).image

        # write captcha for caching
        File.open(EasyCaptcha.cache_temp_dir + "#{generated_code}", 'w') { |f| f.write image }

        # return image
        image
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

    # reset the captcha code in session for security after each request
    def reset_last_captcha_code!
      session.delete(:captcha)
    end

  end
end
