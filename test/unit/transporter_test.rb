require 'test_helper'

class TransporterTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Transporter.new.valid?
  end
end
