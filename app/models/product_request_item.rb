class ProductRequestItem < ActiveRecord::Base
  belongs_to :product_request
  belongs_to :product
end
