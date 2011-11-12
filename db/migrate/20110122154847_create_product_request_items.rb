class CreateProductRequestItems < ActiveRecord::Migration
  def self.up
    create_table :product_request_items do |t|
      t.integer :product_id
      t.integer :quantidade
      t.integer :product_request_id

      t.timestamps
    end
  end

  def self.down
    drop_table :product_request_items
  end
end
