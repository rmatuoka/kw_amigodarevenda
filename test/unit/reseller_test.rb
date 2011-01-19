require 'test_helper'

class ResellerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Reseller.new.valid?
  end
end
