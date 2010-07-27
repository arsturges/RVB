require 'spec_helper'

describe "/drivers/index.html.erb" do
  include DriversHelper

  before(:each) do
    assigns[:drivers] = [
      stub_model(Driver),
      stub_model(Driver)
    ]
  end

  it "renders a list of drivers" do
    render
  end
end
