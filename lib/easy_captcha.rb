module EasyCaptcha
  # Font
  mattr_accessor :font_size, :font_fill_color, :font_family, :font_stroke, :font_stroke_color
  @@font_size = 24
  @@font_fill_color = '#222266'
  @@font_family = File.expand_path('../../../resources/captcha.ttf', __FILE__)
  @@font_stroke = '#000000'
  @@font_stroke_color = 0
  # Image
  mattr_accessor :image_width, :image_height, :image_background_color
  @@image_width = 140
  @@image_height = 40
  @@image_background_color = '#AAAAAA'
  # Sketch
  mattr_accessor :sketch, :sketch_radius, :sketch_sigma
  @@sketch = true
  @@sketch_radius = 3
  @@sketch_sigma = 4
  # Wave
  mattr_accessor :wave, :wave_length, :wave_amplitude
  @@wave = true
  @@wave_length = (60..100)
  @@wave_amplitude = (3..5)
  # Implode
  mattr_accessor :implode
  @@implode = 0.1
  # Gaussian Blur
  mattr_accessor :blur, :blur_radius, :blur_sigma
  @@blur = true
  @@blur_radius = 1
  @@blur_sigma = 2

  class << self
    # setup
    def setup
      yield self
    end

    def sketch?
      sketch
    end

    def wave?
      wave
    end
      
    def blur?
      blur
    end
  end
end

require 'easy_captcha/captcha'

