class Update < ActiveRecord::Base
  attr_accessible :name, :body, :published, :data_inicio, :data_fim, :total_lidos
end
