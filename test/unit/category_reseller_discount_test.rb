require 'test_helper'

class CategoryResellerDiscountTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CategoryResellerDiscount.new.valid?
  end
end
