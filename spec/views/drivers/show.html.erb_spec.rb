require 'spec_helper'

describe "/drivers/show.html.erb" do
  include DriversHelper
  before(:each) do
    assigns[:driver] = @driver = stub_model(Driver)
  end

  it "renders attributes in <p>" do
    render
  end
end
