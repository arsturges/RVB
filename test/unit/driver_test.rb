require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should abide by validations" do
    d=Driver.new
    d.driver=""
    assert !d.save
    d.driver="EISA 2008"
    assert d.save

    e=Driver.new
    e.driver="EISA 2008"
    assert !e.save
    e.driver="new driver"
    assert e.save
  end
end
