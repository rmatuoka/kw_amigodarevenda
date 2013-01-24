#class Notice < ActiveRecord::Base
class Notice < AutenticacaoDatabase
  #attr_accessible :name, :body, :summary, :published
  #validates_presence_of :name, :body, :summary, :published
  
  def self.todas_publicadas
    Notice.all(:conditions =>['published = 1'], :order => 'created_at DESC')
  end
end
