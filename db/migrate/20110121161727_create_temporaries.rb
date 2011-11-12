class CreateTemporaries < ActiveRecord::Migration
  def self.up
    create_table :temporaries do |t|
      t.string :cod_cat
      t.string :categoria
      t.string :cod_produto
      t.string :produto

      t.timestamps
    end
  end

  def self.down
    drop_table :temporaries
  end
end
