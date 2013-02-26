module EasyCaptcha
  # helper class for ActionController
  module ControllerHelpers

    def self.included(base) #:nodoc:
      base.class_eval do
        helper_method :valid_captcha?, :captcha_valid?
      end
    end

    # generate captcha image and return it as blob
    def generate_captcha
      if EasyCaptcha.cache
        # create cache dir
        FileUtils.mkdir_p(EasyCaptcha.cache_temp_dir)

        # select all generated captchas from cache
        files = Dir.glob(EasyCaptcha.cache_temp_dir + "*.png")

        unless files.size < EasyCaptcha.cache_size
          file              = File.open(files.at(Kernel.rand(files.size)))
          session[:captcha] = File.basename(file.path, '.*')

          if file.mtime < EasyCaptcha.cache_expire.ago
            File.unlink(file.path)
            # remove speech version
            File.unlink(file.path.gsub(/png\z/, "wav")) if File.exists?(file.path.gsub(/png\z/, "wav"))
          else
            return file.readlines.join
          end
        end
        generated_code = generate_captcha_code
        image = Captcha.new(generated_code).image

        # write captcha for caching
        File.open(captcha_cache_path(generated_code), 'w') { |f| f.write image }

        # write speech file if u create a new captcha image
        EasyCaptcha.espeak.generate(generated_code, speech_captcha_cache_path(generated_code)) if EasyCaptcha.espeak?

        # return image
        image
      else
        Captcha.new(generate_captcha_code).image
      end
    end

    # generate speech by captcha from session
    def generate_speech_captcha
      raise RuntimeError, "espeak disabled" unless EasyCaptcha.espeak?
      if EasyCaptcha.cache
        File.read(speech_captcha_cache_path(current_captcha_code))
      else
        wav_file = Tempfile.new("#{current_captcha_code}.wav")
        EasyCaptcha.espeak.generate(current_captcha_code, wav_file.path)
        File.read(wav_file.path)
      end
    end

    # return cache path of captcha image
    def captcha_cache_path(code)
      "#{EasyCaptcha.cache_temp_dir}/#{code}.png"
    end

    # return cache path of speech captcha
    def speech_captcha_cache_path(code)
      "#{EasyCaptcha.cache_temp_dir}/#{code}.wav"
    end

    # current active captcha from session
    def current_captcha_code
      session[:captcha]
    end

    # generate captcha code, save in session and return
    def generate_captcha_code
      session[:captcha] = EasyCaptcha.length.times.collect { EasyCaptcha.chars[rand(EasyCaptcha.chars.size)] }.join
    end

    # validate given captcha code and re
    def captcha_valid?(code)
      return false if session[:captcha].blank? or code.blank?
      session[:captcha].to_s.upcase == code.to_s.upcase
    end
    alias_method :valid_captcha?, :captcha_valid?

    # reset the captcha code in session for security after each request
    def reset_last_captcha_code!
      session.delete(:captcha)
    end

  end
end
