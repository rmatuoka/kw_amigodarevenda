class Category < ActiveRecord::Base
  has_many :products
  
  has_many :category_reseller_discounts
  has_many :resellers, :through => :category_reseller_discounts
end
