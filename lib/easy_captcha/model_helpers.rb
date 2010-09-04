module EasyCaptcha
  module ModelHelpers
    # helper class for ActiveRecord
    def self.included(base) #:nodoc:
      base.extend ClassMethods
    end
    
    module ClassMethods
      # to activate model captcha validation
      def acts_as_easy_captcha
        include InstanceMethods
        attr_writer :captcha, :captcha_verification
      end
    end

    module InstanceMethods
      def captcha
        ""
      end

      def valid_captcha?
        errors.add(:captcha, :invalid) unless @captcha.to_s.upcase == @captcha_verification.to_s.upcase
      end
    end
  end
end