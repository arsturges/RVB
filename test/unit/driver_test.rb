require 'test_helper'

class DriverTest < ActiveSupport::TestCase

  test "should abide by validations" do
    d = Factory.build(:driver, :driver => "EISA 2005")
    assert d.save

    e = Factory.build(:driver, :driver => "EISA 2005")
    assert !e.save
  end

  test "should't allow nil fields" do
    f = Factory.build(:driver, :driver=>nil)
    assert !f.save
  end
end