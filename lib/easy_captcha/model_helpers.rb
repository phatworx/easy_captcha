module EasyCaptcha
  module ModelHelpers #:nodoc:
    # helper class for ActiveRecord
    def self.included(base) #:nodoc:
      base.extend ClassMethods
    end
    
    module ClassMethods #:nodoc:
      # to activate model captcha validation
      def acts_as_easy_captcha
        include InstanceMethods
        attr_writer :captcha, :captcha_verification
      end
    end

    module InstanceMethods #:nodoc:

      def captcha  #:nodoc:
        ""
      end

      # validate captcha
      def captcha_valid?
        errors.add(:captcha, :invalid) if @captcha.blank? or @captcha_verification.blank? or @captcha.to_s.upcase != @captcha_verification.to_s.upcase 
      end
      alias_method :valid_captcha?, :captcha_valid?
    end
  end
end
