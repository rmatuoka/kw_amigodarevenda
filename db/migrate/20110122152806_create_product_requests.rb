class CreateProductRequests < ActiveRecord::Migration
  def self.up
    create_table :product_requests do |t|
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :product_requests
  end
end
