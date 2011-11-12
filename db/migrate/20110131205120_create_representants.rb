class CreateRepresentants < ActiveRecord::Migration
  def self.up
    create_table :representants do |t|
      t.string :nome
      t.string :telefone
      t.string :celular
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :representants
  end
end
