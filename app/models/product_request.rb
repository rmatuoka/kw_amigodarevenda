class ProductRequest < ActiveRecord::Base
  has_many :product_request_items
  belongs_to :user
  belongs_to :reseller
  belongs_to :transporter
  
  def self.home
    ProductRequest.all(:conditions => ["NOT status = 'INCOMPLETO'"], :limit => 5)
  end
end
