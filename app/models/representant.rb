class Representant < ActiveRecord::Base
  has_many :resellers
  belongs_to :user
end
