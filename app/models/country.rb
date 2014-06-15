class Country < ActiveRecord::Base
  
    include Centerable
    has_center  

end
