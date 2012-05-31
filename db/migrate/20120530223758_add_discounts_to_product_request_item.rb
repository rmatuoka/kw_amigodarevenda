class AddDiscountsToProductRequestItem < ActiveRecord::Migration
  def self.up
    add_column :product_request_items, :discount, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :product_request_items, :discount2, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :product_request_items, :discount3, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :product_request_items, :discount4, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :product_request_items, :discount5, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :product_request_items, :discount6, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :product_request_items, :discount7, :decimal, :precision => 10, :scale => 2, :default => 0
  end

  def self.down
    remove_column :product_request_items, :discount7
    remove_column :product_request_items, :discount6
    remove_column :product_request_items, :discount5
    remove_column :product_request_items, :discount4
    remove_column :product_request_items, :discount3
    remove_column :product_request_items, :discount2
    remove_column :product_request_items, :discount
  end
end
