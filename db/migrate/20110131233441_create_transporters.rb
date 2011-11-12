class CreateTransporters < ActiveRecord::Migration
  def self.up
    create_table :transporters do |t|
      t.string :nome
      t.timestamps
    end
  end

  def self.down
    drop_table :transporters
  end
end
