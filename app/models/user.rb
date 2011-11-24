class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_authorization_subject
  
  has_many :representants
  has_many :product_requests

  attr_writer :role
  after_save :define_role

  def role
    @role
    if self.has_role? :admin
      @role = :admin
    elsif self.has_role? :revendedor
      @role = :revendedor
    elsif self.has_role? :representante
      @role = :representante
    end
  end

  def define_role
    if @role
      self.has_no_roles!
      self.has_role! @role
    end
  end
end
