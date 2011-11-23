class Representant < ActiveRecord::Base
  has_many :resellers
  belongs_to :user
  
  has_attached_file :image, :styles => { :thumb => "95x95>", :c_medio => "220x220>" }, :default_url => '/images/img_perfilfoto.png'
end
