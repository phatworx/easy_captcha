module EasyCaptcha
  module Generator

    # base class for generators
    class Default < Base

      def defaults
        @font_size              = 24
        @font_fill_color        = '#333333'
        @font_family            = File.expand_path('../../../../resources/captcha.ttf', __FILE__)
        @font_stroke            = '#000000'
        @font_stroke_color      = 0
        @image_width            = 140
        @image_height           = 40
        @image_background_color = '#FFFFFF'
        @sketch                 = true
        @sketch_radius          = 3
        @sketch_sigma           = 1
        @wave                   = true
        @wave_length            = (60..100)
        @wave_amplitude         = (3..5)
        @implode                = 0.05
        @blur                   = true
        @blur_radius            = 1
        @blur_sigma             = 2
      end

      # Font
      attr_accessor :font_size, :font_fill_color, :font_family, :font_stroke, :font_stroke_color

      # Image
      attr_accessor :image_width, :image_height, :image_background_color

      # Sketch
      attr_accessor :sketch, :sketch_radius, :sketch_sigma

      # Wave
      attr_accessor :wave, :wave_length, :wave_amplitude

      # Implode
      attr_accessor :implode

      # Gaussian Blur
      attr_accessor :blur, :blur_radius, :blur_sigma

      def sketch? #:nodoc:
        @sketch
      end

      def wave? #:nodoc:
        @wave
      end

      def blur? #:nodoc:
        @blur
      end

      def generate(code, file = nil)
        canvas = Magick::Image.new(@image_width, @image_height) do |variable|
          @background_color = @image_background_color unless @image_background_color.nil?
        end

        # Render the text in the image
        canvas.annotate(Magick::Draw.new, 0, 0, 0, 0, code) {
          @gravity     = Magick::CenterGravity
          @font_family = @font_family
          @font_weight = Magick::LighterWeight
          @fill        = @font_fill_color
          if @font_stroke.to_i > 0
            @stroke       = @font_stroke_color
            @stroke_width = @font_stroke
          end
          @pointsize = @font_size
        }

        # Blur
        canvas = canvas.blur_image(@blur_radius, @blur_sigma) if blur?

        # Wave
        w = @wave_length
        a = @wave_amplitude
        canvas = canvas.wave(rand(a.last - a.first) + a.first, rand(w.last - w.first) + w.first) if wave?

        # Sketch
        canvas = canvas.sketch(@sketch_radius, @sketch_sigma, rand(180)) if sketch?

        # Implode
        canvas = canvas.implode(@implode.to_f) if @implode.is_a? Float

        # Crop image because to big after waveing
        canvas = canvas.crop(Magick::CenterGravity, @image_width, @image_height)

        unless file.nil?
          canvas.write(file) { self.format = 'PNG' }
        end
        image = canvas.to_blob { self.format = 'PNG' }
        canvas.destroy!
        image
      end

    end
  end
end