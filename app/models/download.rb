class Download < ActiveRecord::Base
  attr_accessible :name, :description, :total_downloads, :file, :published
  
  has_attached_file :file,
        :url => "/uploads/:attachment/:id/:basename_:style.:extension",
        :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"
end
