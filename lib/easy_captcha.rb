require 'RMagick'
require 'rails'
require 'action_controller'
require 'active_record'
require 'active_support'

# Captcha-Plugin for Rails
module EasyCaptcha
  autoload :Captcha, 'easy_captcha/captcha'
  autoload :Controller, 'easy_captcha/controller'
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
  @@cache_size = 0

  # Cache expire
  mattr_accessor :cache_expire
  @@cache_expire = 0

  # Chars
  mattr_accessor :chars
  @@chars = %w(2 3 4 5 6 7 9 A C D E F G H J K L M N P Q R S T U X Y Z)

  # Length
  mattr_accessor :length
  @@length = 6

  class << self
    # to configure easy_captcha
    # for a sample look the readme.rdoc file
    def setup
      yield self
    end

    def cache? #:nodoc:
      cache
    end

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



