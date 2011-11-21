require File.expand_path('../boot', __FILE__)
require 'rails/all'
module KwAmigodarevenda
  class Application < Rails::Application
    #config.gem "authlogic"
    #config.gem "acl9", :source => "http://gemcutter.org", :lib => "acl9"
    I18n.default_locale = "pt-BR" 
  end
end