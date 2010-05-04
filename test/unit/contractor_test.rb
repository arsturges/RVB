require 'test_helper'

class ContractorTest < ActiveSupport::TestCase
  
  test "shouldn't allow duplicates" do
    c = Contractor.create(:contractor => "Lawrence", :abbreviation => "LBNL")
    d = Contractor.new(:contractor => "Lawrence", :abbreviation => "LBNL")
    assert !d.save
    d.contractor = "Lawrence Berkeley"
    assert !d.save
    d.abbreviation = "LBL"
    assert d.save
  end
  
  test "shouldn't allow nil values" do
    e = Factory.build(:contractor, :contractor=>nil, :abbreviation => nil)
    assert !e.save
    e.contractor = "OnLocation"
    assert !e.save
    e.abbreviation = "onLoc"
    assert e.save
  end
end