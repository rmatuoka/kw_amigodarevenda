class CategoryResellerDiscount < ActiveRecord::Base
  belongs_to :category
  belongs_to :reseller
end
