class CreateSirepres < ActiveRecord::Migration
  def self.up
    create_table :sirepres, :id => false, :force => true do |t|
      t.string :cod_repre
      t.string :representante
      t.string :fantasia
      t.timestamps
    end
    add_index :sirepres, :cod_repre, :unique => true
  end

  def self.down
    drop_table :sirepres
  end
end
