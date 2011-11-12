class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :cod_sistema
      t.string :nome
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
