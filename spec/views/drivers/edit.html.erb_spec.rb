require 'spec_helper'

describe "/drivers/edit.html.erb" do
  include DriversHelper

  before(:each) do
    assigns[:driver] = @driver = stub_model(Driver,
      :new_record? => false
    )
  end

  it "renders the edit driver form" do
    render

    response.should have_tag("form[action=#{driver_path(@driver)}][method=post]") do
    end
  end
end
