class Offer < ActiveRecord::Base
  attr_accessible :name, :body, :date_inicio, :data_fim, :published, :total_clicks, :image
  
  has_attached_file :image, :styles => { :thumb => "226x236>", :c_medio => "550x550>" },
        :url => "/uploads/:attachment/:id/:basename_:style.:extension",
        :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"
        
  def self.get_promocao
    Offer.first(:conditions => ['published = 1 AND date_inicio <= ? AND data_fim >= ?', Date.today, Date.today])
  end
end
