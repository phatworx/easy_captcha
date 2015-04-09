require 'rails'
require 'action_controller'
require 'active_record'
require 'active_support'

# Captcha-Plugin for Rails
module EasyCaptcha
  autoload :Espeak, 'easy_captcha/espeak'
  autoload :Captcha, 'easy_captcha/captcha'
  autoload :CaptchaController, 'easy_captcha/captcha_controller'
  autoload :ModelHelpers, 'easy_captcha/model_helpers'
  autoload :ViewHelpers, 'easy_captcha/view_helpers'
  autoload :ControllerHelpers, 'easy_captcha/controller_helpers'
  autoload :Generator, 'easy_captcha/generator'

  # Cache
  mattr_accessor :cache
  @@cache = false

  # Cache temp
  mattr_accessor :cache_temp_dir
  @@cache_temp_dir = nil

  # Cache size
  mattr_accessor :cache_size
  @@cache_size = 500

  # Cache expire
  mattr_accessor :cache_expire
  @@cache_expire = nil

  # Chars
  mattr_accessor :chars
  @@chars = %w(2 3 4 5 6 7 9 A C D E F G H J K L M N P Q R S T U X Y Z)

  # Length
  mattr_accessor :length
  @@length = 6

  # Length
  mattr_accessor :image_width, :image_height
  @@image_width  = 140
  @@image_height = 40

  class << self
    # to configure easy_captcha
    # for a sample look the readme.rdoc file
    def setup
      yield self
    end

    def cache? #:nodoc:
      cache
    end

    # select generator and configure this
    def generator(generator = nil, &block)
      if generator.nil?
        @generator
      else
        generator = generator.to_s if generator.is_a? Symbol

        if generator.is_a? String
          generator.gsub!(/^[a-z]|\s+[a-z]/) { |a| a.upcase }
          generator = "EasyCaptcha::Generator::#{generator}".constantize
        end

        @generator = generator.new &block
      end
    end

    def espeak=(state)
      if state === true
        @espeak = Espeak.new
      else
        @espeak = false
      end
    end

    def espeak(&block)
      if block_given?
        @espeak = Espeak.new &block
      else
        @espeak ||= false
      end
    end

    def espeak?
      not espeak === false
    end

    # depracated
    def method_missing name, *args
      name = name.to_s # fix for jruby
      depracations = [
          :font_size, :font_fill_color, :font_family, :font_stroke, :font_stroke_color,
          :image_background_color, :sketch, :sketch_radius, :sketch_sigma, :wave,
          :wave_length, :wave_amplitude, :implode, :blur, :blur_radius, :blur_sigma
      ]

      if depracations.include? name[0..-2].to_sym or depracations.include? name.to_sym
        ActiveSupport::Deprecation.warn "EasyCaptcha.#{name} is deprecated."
        if name[-1,1] == '='
          self.generator.send(name, args.first)
        else
          self.generator.send(name)
        end
      else
        super
      end
    end


    # called by rails after initialize
    def init
      require 'easy_captcha/routes'
      ActiveRecord::Base.send :include, ModelHelpers
      ActionController::Base.send :include, ControllerHelpers
      ActionView::Base.send :include, ViewHelpers

      # set default generator
      generator :default

    end
  end
end

EasyCaptcha.init



