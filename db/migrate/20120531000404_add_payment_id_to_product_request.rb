class AddPaymentIdToProductRequest < ActiveRecord::Migration
  def self.up
    add_column :product_requests, :payment_id, :integer
  end

  def self.down
    remove_column :product_requests, :payment_id
  end
end
