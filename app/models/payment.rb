class Payment < ActiveRecord::Base
  has_many :product_requests
end
