# encoding: utf-8
module EasyCaptcha
  # captcha generation class
  class Captcha
    # code for captcha generation
    attr_reader :code
    # blob of generated captcha image
    attr_reader :image

    # generate captcha by code
    def initialize code
      @code = code
      generate_captcha
    end

    def inspect #:nodoc:
      "<EasyCaptcha::Captcha @code=#{code}>"
    end

    private

    def generate_captcha #:nodoc:
      @image = EasyCaptcha.generator.generate(@code)
    end
  end
end
