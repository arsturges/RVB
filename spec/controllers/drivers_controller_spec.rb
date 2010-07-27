require 'spec_helper'

describe DriversController do

  def mock_driver(stubs={})
    @mock_driver ||= mock_model(Driver, stubs)
  end

  describe "GET index" do
    it "assigns all drivers as @drivers" do
      Driver.stub(:find).with(:all).and_return([mock_driver])
      get :index
      assigns[:drivers].should == [mock_driver]
    end
  end

  describe "GET show" do
    it "assigns the requested driver as @driver" do
      Driver.stub(:find).with("37").and_return(mock_driver)
      get :show, :id => "37"
      assigns[:driver].should equal(mock_driver)
    end
  end

  describe "GET new" do
    it "assigns a new driver as @driver" do
      Driver.stub(:new).and_return(mock_driver)
      get :new
      assigns[:driver].should equal(mock_driver)
    end
  end

  describe "GET edit" do
    it "assigns the requested driver as @driver" do
      Driver.stub(:find).with("37").and_return(mock_driver)
      get :edit, :id => "37"
      assigns[:driver].should equal(mock_driver)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created driver as @driver" do
        Driver.stub(:new).with({'these' => 'params'}).and_return(mock_driver(:save => true))
        post :create, :driver => {:these => 'params'}
        assigns[:driver].should equal(mock_driver)
      end

      it "redirects to the created driver" do
        Driver.stub(:new).and_return(mock_driver(:save => true))
        post :create, :driver => {}
        response.should redirect_to(driver_url(mock_driver))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved driver as @driver" do
        Driver.stub(:new).with({:driver => ''}).and_return(mock_driver(:save => false))
        post :create, :driver => {:driver => ''}
        assigns[:driver].should equal(mock_driver)
      end

      it "re-renders the 'new' template" do
        Driver.stub(:new).and_return(mock_driver(:save => false))
        post :create, :driver => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested driver" do
        Driver.should_receive(:find).with("37").and_return(mock_driver)
        mock_driver.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :driver => {:these => 'params'}
      end

      it "assigns the requested driver as @driver" do
        Driver.stub(:find).and_return(mock_driver(:update_attributes => true))
        put :update, :id => "1"
        assigns[:driver].should equal(mock_driver)
      end

      it "redirects to the driver" do
        Driver.stub(:find).and_return(mock_driver(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(driver_url(mock_driver))
      end
    end

    describe "with invalid params" do
      it "updates the requested driver" do
        Driver.should_receive(:find).with("37").and_return(mock_driver)
        mock_driver.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :driver => {:these => 'params'}
      end

      it "assigns the driver as @driver" do
        Driver.stub(:find).and_return(mock_driver(:update_attributes => false))
        put :update, :id => "1"
        assigns[:driver].should equal(mock_driver)
      end

      it "re-renders the 'edit' template" do
        Driver.stub(:find).and_return(mock_driver(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested driver" do
      Driver.should_receive(:find).with("37").and_return(mock_driver)
      mock_driver.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the drivers list" do
      Driver.stub(:find).and_return(mock_driver(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(drivers_url)
    end
  end

end
