class AddItensToProductRequest < ActiveRecord::Migration
  def self.up
    add_column :product_requests, :transporter_id, :integer
    add_column :product_requests, :reseller_id, :integer
  end

  def self.down
    remove_column :product_requests, :reseller_id
    remove_column :product_requests, :transporter_id
  end
end
