require 'test_helper'

class DoeProjectManagerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should abide validations" do
    d=DoeProjectManager.new
    d.project_manager=""
    assert !d.save
    d.project_manager="mike"
    assert d.save

    e=DoeProjectManager.new
    e.project_manager="mike"
    assert !e.save
    e.project_manager="Jon"
    assert e.save
  end
end
