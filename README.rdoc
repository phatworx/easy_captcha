= EasyCaptcha
A simple captcha implementation for rails 3 based on rmagick

Tested with Rails 3.2.8

https://travis-ci.org/phatworx/easy_captcha.png

== Installation
add to Gemfile
  gem 'easy_captcha'
  gem 'rmagick'

for java you can use

  gem 'rmagick4j'

after bundle execute
  rails g easy_captcha:install

== Configuration
You can configure easy_captcha in "config/initializers/easy_captcha.rb", if you want to customize the default configuration

  EasyCaptcha.setup do |config|
    # Cache
    # config.cache          = true
    # Cache temp dir from Rails.root
    # config.cache_temp_dir = Rails.root.join('tmp', 'captchas')
    # Cache size
    # config.cache_size     = 500
    # Cache expire
    # config.cache_expire   = 1.day

    # Chars
    # config.chars          = %w(2 3 4 5 6 7 9 A C D E F G H J K L M N P Q R S T U X Y Z)

    # Length
    # config.length         = 6

    # Image
    # config.image_height   = 40
    # config.image_width    = 140

    # eSpeak (default disabled)
    # config.espeak do |espeak|
      # Amplitude, 0 to 200
      # espeak.amplitude = 80..120

      # Word gap. Pause between words
      # espeak.gap = 80

      # Pitch adjustment, 0 to 99
      # espeak.pitch = 30..70

      # Use voice file of this name from espeak-data/voices
      # espeak.voice = nil
    # end

    # configure generator
    # config.generator :default do |generator|

      # Font
      # generator.font_size              = 24
      # generator.font_fill_color        = '#333333'
      # generator.font_stroke_color      = '#000000'
      # generator.font_stroke            = 0
      # generator.font                   = File.expand_path('../../resources/afont.ttf', __FILE__)


      # Background color
      # generator.image_background_color = "#FFFFFF"
      # Or background image (e.g. transparent png)
      # generator.background_image       = File.expand_path('../../resources/captcha_bg.png', __FILE__)

      # Wave
      # generator.wave                   = true
      # generator.wave_length            = (60..100)
      # generator.wave_amplitude         = (3..5)

      # Sketch
      # generator.sketch                 = true
      # generator.sketch_radius          = 3
      # generator.sketch_sigma           = 1

      # Implode
      # generator.implode                = 0.1

      # Blur
      # generator.blur                   = true
      # generator.blur_radius            = 1
      # generator.blur_sigma             = 2
    # end
  end

== Caching
It is strongly recommended to enable caching. You can see the three paramters which you have to fill in your config file below.

  EasyCaptcha.setup do |config|
    # Cache
    config.cache          = true
    # Cache temp dir from Rails.root
    config.cache_temp_dir = Rails.root.join('tmp', 'captchas')
    # Cache expire
    config.cache_expire   = 1.day
    # Cache size
    # config.cache_size     = 500
  end

== Requirements

* RMagick
* Rails 3 (http://github.com/rails/rails)

== Example

  <% form_tag '/' do %>
    <% if request.post? %>
      <p><%= valid_captcha?(params[:captcha]) ? 'valid' : 'invalid' %> captcha</p>
    <% end %>
    <p><%= captcha_tag %></p>
    <p><%= text_field_tag :captcha %></p>
    <p><%= submit_tag 'Validate' %></p>
  <% end %>

== Example app
You find an example app under: http://github.com/phatworx/easy_captcha_example

== History
* 0.1 init
* 0.2 cache support for high frequented sites
* 0.3 use generators, optimizations, update licence to same of all my plugins
* 0.4 generator support
* 0.5 (transparent) background support
* 0.6 espeak support for barrier-free support

== Maintainers

* Team Phatworx (http://github.com/phatworx)
* Marco Scholl (http://github.com/traxanos)
* Alexander Dreher (http://github.com/alexdreher)
* Christoph Chilian (http://github.com/cc-web)

== Contributing to EasyCaptcha

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2010 Marco Scholl. See LICENSE.txt for further details.
