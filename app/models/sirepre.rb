class Sirepre < ActiveRecord::Base
  attr_accessible :cod_repre, :representante, :fantasia
  set_primary_key :cod_repre
  has_many :sirevs, :foreign_key => 'cod_repre'
end
