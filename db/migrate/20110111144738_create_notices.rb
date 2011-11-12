class CreateNotices < ActiveRecord::Migration
  def self.up
    create_table :notices do |t|
      t.string :name
      t.text :body
      t.string :summary
      t.integer :published
      t.timestamps
    end
  end

  def self.down
    drop_table :notices
  end
end
