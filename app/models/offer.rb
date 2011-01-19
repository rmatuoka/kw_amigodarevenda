class Offer < ActiveRecord::Base
  attr_accessible :name, :body, :date_inicio, :data_fim, :published, :total_clicks, :image
  
  has_attached_file :image, :styles => { :thumb => "226x236>", :c_medio => "550x550>" },
        :url => "/uploads/:attachment/:id/:basename_:style.:extension",
        :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"
end
