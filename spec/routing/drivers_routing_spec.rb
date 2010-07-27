require 'spec_helper'

describe DriversController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/drivers" }.should route_to(:controller => "drivers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/drivers/new" }.should route_to(:controller => "drivers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/drivers/1" }.should route_to(:controller => "drivers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/drivers/1/edit" }.should route_to(:controller => "drivers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/drivers" }.should route_to(:controller => "drivers", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/drivers/1" }.should route_to(:controller => "drivers", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/drivers/1" }.should route_to(:controller => "drivers", :action => "destroy", :id => "1") 
    end
  end
end
