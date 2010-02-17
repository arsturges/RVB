require 'test_helper'

class DateCategoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "shouldn't violate validations" do

    d=DateCategory.new
    d.date_category=""
    assert !d.save
    d.date_category="new date category"
    assert d.save

    e=DateCategory.new
    e.date_category="new date category"
    assert !e.save
    e.date_category="a unique name"
    assert e.save
  end
end
