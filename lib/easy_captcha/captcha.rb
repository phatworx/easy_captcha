module EasyCaptcha
  # captcha generation class
  class Captcha
    # code for captcha generation
    attr_reader :code
    # blob of generated captcha image
    attr_reader :image

    # generate captcha by code
    def initialize(code, file = nil)
      @code = code
      generate_captcha(file)
    end

    def inspect #:nodoc:
      "<EasyCaptcha::Captcha @code=#{code}>"
    end

    private

    def generate_captcha(file = nil) #:nodoc:
      @image = EasyCaptcha.generator.generate(@code, file)
    end
  end
end
