require 'spec_helper'

describe Driver do
  before(:each) do
    driver = Factory(:driver)
    @valid_attributes = {
      :driver => "new driver"
    }
  end

  it "should create a new instance given valid attributes" do
    Factory.build(:driver, :driver => "EISA 2005").valid?
    #Driver.create!(@valid_attributes)
  end
  it " should like rvb"

end
