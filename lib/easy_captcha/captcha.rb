module EasyCaptcha
  # captcha generation class
  class Captcha
    # code for captcha generation
    attr_reader :code
    # blob of generated captcha image
    attr_reader :image

    # generate captcha by code
    def initialize(code, file)
      @code = code
      generate_captcha(file)
    end

    def inspect #:nodoc:
      "<EasyCaptcha::Captcha @code=#{code}>"
    end

    private

    def generate_captcha(file = nil) #:nodoc:
      canvas = Magick::Image.new(EasyCaptcha.image_width, EasyCaptcha.image_height) do |variable|
        self.background_color = EasyCaptcha.image_background_color unless EasyCaptcha.image_background_color.nil?
      end

      # Render the text in the image
      canvas.annotate(Magick::Draw.new, 0, 0, 0, 0, code) {
        self.gravity     = Magick::CenterGravity
        self.font_family = EasyCaptcha.font_family
        self.font_weight = Magick::LighterWeight
        self.fill        = EasyCaptcha.font_fill_color
        if EasyCaptcha.font_stroke.to_i > 0
          self.stroke       = EasyCaptcha.font_stroke_color
          self.stroke_width = EasyCaptcha.font_stroke
        end
        self.pointsize = EasyCaptcha.font_size
      }

      # Blur
      canvas = canvas.blur_image(EasyCaptcha.blur_radius, EasyCaptcha.blur_sigma) if EasyCaptcha.blur?

      # Wave
      w = EasyCaptcha.wave_length
      a = EasyCaptcha.wave_amplitude
      canvas = canvas.wave(rand(a.last - a.first) + a.first, rand(w.last - w.first) + w.first) if EasyCaptcha.wave?

      # Sketch
      canvas = canvas.sketch(EasyCaptcha.sketch_radius, EasyCaptcha.sketch_sigma, rand(180)) if EasyCaptcha.sketch?

      # Implode
      canvas = canvas.implode(EasyCaptcha.implode.to_f) if EasyCaptcha.implode.is_a? Float

      # Crop image because to big after waveing
      canvas = canvas.crop(Magick::CenterGravity, EasyCaptcha.image_width, EasyCaptcha.image_height)

      unless file.nil?
        canvas.write(file) { self.format = 'PNG' }
      end
      @image = canvas.to_blob { self.format = 'PNG' }
      canvas.destroy!
    end
  end
end
