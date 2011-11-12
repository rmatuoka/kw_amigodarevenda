require 'test_helper'

class RepresentantTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Representant.new.valid?
  end
end
