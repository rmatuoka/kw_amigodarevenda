class CreateSupertemporaries < ActiveRecord::Migration
  def self.up
    create_table :supertemporaries, :id => false do |t|
      t.string :field01
      t.string :field02
      t.string :field03
      t.string :field04
      t.string :field05
      t.string :field06
      t.string :field07
      t.string :field08
      t.string :field09
      t.string :field10
      t.string :field11
      t.string :field12
      t.string :field13
      t.string :field14
      t.string :field15
      t.string :field16
      t.string :field17
      t.string :field18
      t.string :field19
      t.string :field20
      t.string :field21
      t.string :field22
      t.string :field23
      t.string :field24
      t.string :field25
      t.string :field26
      t.string :field27
      t.string :field28
      t.string :field29
      t.string :field30

      t.timestamps
    end
  end

  def self.down
    drop_table :supertemporaries
  end
end
