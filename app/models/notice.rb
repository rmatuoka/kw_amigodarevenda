class Notice < ActiveRecord::Base
  attr_accessible :name, :body, :summary, :published
end
