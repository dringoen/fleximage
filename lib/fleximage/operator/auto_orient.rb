module Fleximage
  module Operator
    
    # Auto-orient the image without doing any resizing first.  
    #
    # Example:
    #
    #   @photo.operate do |image|
    #     image.auto_orient
    #   end
    class AutoOrient < Operator::Base
      def operate(options = {})
        # auto orient the image
        @image.auto_orient!
      end
    end
    
  end
end