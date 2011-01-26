module EasyCaptcha
  module Generator

    # base class for generators
    class Base

      # generator for captcha images
      def initialize(&block)
        defaults
        yield self if block_given?
      end

      # default values for generator
      def defaults
      end

    end
  end
end