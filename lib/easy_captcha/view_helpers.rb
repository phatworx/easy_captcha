module EasyCaptcha
  module ViewHelpers
    def captcha_tag(*args)
      options = args.extract_options!
      image_tag(captcha_path(:i => Time.now.to_i), options)
    end
  end
end