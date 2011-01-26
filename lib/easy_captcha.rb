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

  # Generator for captcha
  mattr_accessor :generator

  class << self
    # to configure easy_captcha
    # for a sample look the readme.rdoc file
    def setup
      yield self
    end

    def cache? #:nodoc:
      cache
    end

    # called by rails after initialize
    def init
      require 'easy_captcha/routes'
      ActiveRecord::Base.send :include, ModelHelpers
      ActionController::Base.send :include, ControllerHelpers
      ActionView::Base.send :include, ViewHelpers

      # set default generator
      EasyCaptcha.generator = EasyCaptcha::Generator::Default.new if EasyCaptcha.generator.nil?

    end
  end
end

EasyCaptcha.init



