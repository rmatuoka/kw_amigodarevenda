class PollQuestion < ActiveRecord::Base
  belongs_to :poll
  attr_accessible :poll_id, :question, :published, :total_votes
end
