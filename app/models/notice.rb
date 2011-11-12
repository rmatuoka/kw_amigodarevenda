class Notice < ActiveRecord::Base
  attr_accessible :name, :body, :summary, :published
  
  def self.todas_publicadas
    Notice.all(:conditions => ['published = 1'])
  end
end
