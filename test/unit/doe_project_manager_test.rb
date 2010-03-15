require 'test_helper'

class DoeProjectManagerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should abide validations" do
    d = Factory.build(:doe_project_manager, :project_manager=>nil)
    assert !d.save
    d = Factory.build(:doe_project_manager)
    assert d.save

  end
end
