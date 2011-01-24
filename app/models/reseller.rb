class Reseller < ActiveRecord::Base
  has_attached_file :image, :styles => { :thumb => "50x50>", :c_medio => "222x222>" },
        :url => "/uploads/:attachment/:id/:basename_:style.:extension",
        :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"  
end
