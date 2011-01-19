class Poll < ActiveRecord::Base
  has_many :poll_questions
  attr_accessible :name, :multiple, :data_inicio, :data_fim, :published
end
