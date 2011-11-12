class AddPriceToProductRequestItem < ActiveRecord::Migration
  def self.up
    add_column :product_request_items, :valor, :decimal
  end

  def self.down
    remove_column :product_request_items, :valor
  end
end
