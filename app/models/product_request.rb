class ProductRequest < ActiveRecord::Base
  has_many :product_request_items
  belongs_to :user
  belongs_to :reseller
  belongs_to :transporter
  belongs_to :payment
  
  def self.home
    ProductRequest.all(:conditions => ["NOT status = 'INCOMPLETO'"], :limit => 5, :order => "id DESC")
  end
end
