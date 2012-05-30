class AddItensToCategoryResellerDiscount < ActiveRecord::Migration
  def self.up
    add_column :category_reseller_discounts, :discount2, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :category_reseller_discounts, :discount3, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :category_reseller_discounts, :discount4, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :category_reseller_discounts, :discount5, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :category_reseller_discounts, :discount6, :decimal, :precision => 10, :scale => 2, :default => 0 
    add_column :category_reseller_discounts, :discount7, :decimal, :precision => 10, :scale => 2, :default => 0
  end

  def self.down
    remove_column :category_reseller_discounts, :discount7
    remove_column :category_reseller_discounts, :discount6
    remove_column :category_reseller_discounts, :discount5
    remove_column :category_reseller_discounts, :discount4
    remove_column :category_reseller_discounts, :discount3
    remove_column :category_reseller_discounts, :discount2
  end
end
