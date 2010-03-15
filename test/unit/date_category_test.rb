require 'test_helper'

class DateCategoryTest < ActiveSupport::TestCase
  test "shouldn't violate validations" do

    d=Factory.build(:date_category, :date_category=>nil)
    assert !d.save

    e=Factory.build(:date_category)
    assert e.save
  end
end
