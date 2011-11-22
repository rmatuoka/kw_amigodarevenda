class ProductRequest < ActiveRecord::Base
  has_many :product_request_items
  belongs_to :user
  belongs_to :reseller
  belongs_to :transporter
end
