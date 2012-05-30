class CreateCategoryResellerDiscounts < ActiveRecord::Migration
  def self.up
    create_table :category_reseller_discounts do |t|
      t.integer :category_id
      t.integer :reseller_id
      t.decimal :discount, :precision => 10, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :category_reseller_discounts
  end
end
