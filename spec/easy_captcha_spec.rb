require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe EasyCaptcha do
  describe :setup do
    EasyCaptcha.setup do |config|
      # Cache
      config.cache = false

      # Chars
      config.chars = %w(2 3 4 5 6 7 9 A C D E F G H J K L M N P Q R S T U X Y Z)

      # Length
      config.length = 6

      # Image
      config.image_height = 40
      config.image_width = 140

      # configure generator
      config.generator :default do |generator|
        # Font
        generator.font_size = 24
        generator.font_fill_color = '#333333'
        generator.font_stroke_color = '#000000'
        generator.font_stroke = 0
        generator.font_family = File.expand_path('../../resources/afont.ttf', __FILE__)

        generator.image_background_color = '#FFFFFF'

        # Wave
        generator.wave = true
        generator.wave_length = (60..100)
        generator.wave_amplitude = (3..5)

        # Sketch
        generator.sketch = true
        generator.sketch_radius = 3
        generator.sketch_sigma = 1

        # Implode
        generator.implode = 0.1

        # Blur
        generator.blur = true
        generator.blur_radius = 1
        generator.blur_sigma = 2
      end
    end

    it 'should not cache' do
      EasyCaptcha.cache?.should be_false
    end

    it 'should have default generator' do
      EasyCaptcha.generator.should be_an(EasyCaptcha::Generator::Default)
    end

    describe :depracations do
      before do
        EasyCaptcha.setup do |config|
          # Length
          config.length = 6

          # Image
          config.image_height = 40
          config.image_width = 140

          config.generator :default do |generator|
            # Font
            generator.font_size = 24
            generator.font_fill_color = '#333333'
            generator.font_stroke_color = '#000000'
            generator.font_stroke = 0
            generator.font_family = File.expand_path('../../resources/afont.ttf', __FILE__)

            generator.image_background_color = '#FFFFFF'

            # Wave
            generator.wave = true
            generator.wave_length = (60..100)
            generator.wave_amplitude = (3..5)

            # Sketch
            generator.sketch = true
            generator.sketch_radius = 3
            generator.sketch_sigma = 1

            # Implode
            generator.implode = 0.1

            # Blur
            generator.blur = true
            generator.blur_radius = 1
            generator.blur_sigma = 2
          end
        end
      end

      it 'get config' do
        [
          :font_size, :font_fill_color, :font_family, :font_stroke, :font_stroke_color,
          :image_background_color, :sketch, :sketch_radius, :sketch_sigma, :wave,
          :wave_length, :wave_amplitude, :implode, :blur, :blur_radius, :blur_sigma
        ].each do |method|
          EasyCaptcha.generator.send(method).should_not be_nil
        end
      end

      it 'method_missing should call normal on non depracations' do
        -> { EasyCaptcha.send('a_missing_method') }.should raise_error
      end
    end
  end
end
