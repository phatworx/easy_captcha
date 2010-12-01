require 'RMagick'
require 'rails'
require 'action_controller'
require 'active_record'

# Captcha-Plugin for Rails
module EasyCaptcha
  autoload :Captcha, 'easy_captcha/captcha'
  autoload :Controller, 'easy_captcha/controller'
  autoload :ModelHelpers, 'easy_captcha/model_helpers'
  autoload :ViewHelpers, 'easy_captcha/view_helpers'
  autoload :ControllerHelpers, 'easy_captcha/controller_helpers'

  # Cache
  mattr_accessor :cache
  @@cache = true

  # Cache temp
  mattr_accessor :cache_temp_dir
  @@cache_temp_dir = Rails.root + 'tmp' + 'captchas'

  # Cache size
  mattr_accessor :cache_size
  @@cache_size = 500

  # Cache expire
  mattr_accessor :cache_expire
  @@cache_expire = 1.days

  # Chars
  mattr_accessor :chars
  @@chars = %w(2 3 4 5 6 7 9 A C D E F G H J K L M N P Q R S T U X Y Z)
  # Length
  mattr_accessor :length
  @@length = 6
  # Font
  mattr_accessor :font_size, :font_fill_color, :font_family, :font_stroke, :font_stroke_color
  @@font_size = 24
  @@font_fill_color = '#333333'
  @@font_family = File.expand_path('../../../resources/captcha.ttf', __FILE__)
  @@font_stroke = '#000000'
  @@font_stroke_color = 0
  # Image
  mattr_accessor :image_width, :image_height, :image_background_color
  @@image_width = 140
  @@image_height = 40
  @@image_background_color = '#FFFFFF'
  # Sketch
  mattr_accessor :sketch, :sketch_radius, :sketch_sigma
  @@sketch = true
  @@sketch_radius = 3
  @@sketch_sigma = 1
  # Wave
  mattr_accessor :wave, :wave_length, :wave_amplitude
  @@wave = true
  @@wave_length = (60..100)
  @@wave_amplitude = (3..5)
  # Implode
  mattr_accessor :implode
  @@implode = 0.05
  # Gaussian Blur
  mattr_accessor :blur, :blur_radius, :blur_sigma
  @@blur = true
  @@blur_radius = 1
  @@blur_sigma = 2

  class << self
    # to configure easy_captcha
    # for a sample look the readme.rdoc file
    def setup
      yield self
    end

    def sketch? #:nodoc:
      sketch
    end

    def wave? #:nodoc:
      wave
    end

    def blur? #:nodoc:
      blur
    end

    def cache? #:nodoc:
      cache
    end

    # called by rails after initialize
    def init
      ActiveRecord::Base.send :include, ModelHelpers
      ActionController::Base.send :include, ControllerHelpers
      ActionView::Base.send :include, ViewHelpers
    end
  end
end

EasyCaptcha.init



