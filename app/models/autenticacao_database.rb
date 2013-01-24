class AutenticacaoDatabase < ActiveRecord::Base
  self.abstract_class = true
  #establish_connection "nautilus_#{RAILS_ENV}" Usar este se existir um banco para producao e outro para desenvolvimento
  establish_connection "nautilus_production"
end
