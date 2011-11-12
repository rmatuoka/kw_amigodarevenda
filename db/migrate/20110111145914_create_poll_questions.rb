class CreatePollQuestions < ActiveRecord::Migration
  def self.up
    create_table :poll_questions do |t|
      t.integer :poll_id
      t.string :question
      t.boolean :published
      t.integer :total_votes
      t.timestamps
    end
  end

  def self.down
    drop_table :poll_questions
  end
end
