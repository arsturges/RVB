require 'test_helper'

class RevisionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "shouldn't save two revisions with same revision number" do
    r = Revision.new(:revision_number => 1, :revision_date => Date.today)
    t = Revision.new(:revision_number => 1, :revision_date => "2010-03-15")
    assert r.save
    assert !t.save
  end
end
