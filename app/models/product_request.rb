class ProductRequest < ActiveRecord::Base
  has_many :product_request_items
  belongs_to :user
  belongs_to :reseller
end
