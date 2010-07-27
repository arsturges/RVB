require 'spec_helper'

describe "/drivers/new.html.erb" do
  include DriversHelper

  before(:each) do
    assigns[:driver] = stub_model(Driver,
      :new_record? => true
    )
  end

  it "renders new driver form" do
    render

    response.should have_tag("form[action=?][method=post]", drivers_path) do
    end
  end
end
