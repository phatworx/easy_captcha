module EasyCaptcha
  class Config
    @@image
    
    @@config = {
      :image => {
        :width => 150,
        :height => 30
        :color => '#EEEEEE',
      },
      :font => {
        :color => '#E20074',
        :size => 20,
        :ttf => File.expand_path('../../../resources/captcha.ttf', __FILE__)        
      }
    }
    
    cattr_accessor :image_  
  end
end