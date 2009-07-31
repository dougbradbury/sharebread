require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DrivesController do

  def mock_drive(stubs={})
    @mock_drive ||= mock_model(Drive, stubs)
  end

  describe "GET index" do
    it "assigns all drives as @drives" do
      Drive.stub!(:find).with(:all).and_return([mock_drive])
      get :index
      assigns[:drives].should == [mock_drive]
    end
  end

  describe "GET show" do
    it "assigns the requested drive as @drive" do
      Drive.stub!(:find).with("37").and_return(mock_drive)
      get :show, :id => "37"
      assigns[:drive].should equal(mock_drive)
    end
  end

  describe "GET new" do
    it "assigns a new drive as @drive" do
      Drive.stub!(:new).and_return(mock_drive)
      get :new
      assigns[:drive].should equal(mock_drive)
    end
  end

  describe "GET edit" do
    it "assigns the requested drive as @drive" do
      Drive.stub!(:find).with("37").and_return(mock_drive)
      get :edit, :id => "37"
      assigns[:drive].should equal(mock_drive)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created drive as @drive" do
        Drive.stub!(:new).with({'these' => 'params'}).and_return(mock_drive(:save => true))
        post :create, :drive => {:these => 'params'}
        assigns[:drive].should equal(mock_drive)
      end

      it "redirects to the created drive" do
        Drive.stub!(:new).and_return(mock_drive(:save => true))
        post :create, :drive => {}
        response.should redirect_to(drive_url(mock_drive))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved drive as @drive" do
        Drive.stub!(:new).with({'these' => 'params'}).and_return(mock_drive(:save => false))
        post :create, :drive => {:these => 'params'}
        assigns[:drive].should equal(mock_drive)
      end

      it "re-renders the 'new' template" do
        Drive.stub!(:new).and_return(mock_drive(:save => false))
        post :create, :drive => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested drive" do
        Drive.should_receive(:find).with("37").and_return(mock_drive)
        mock_drive.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :drive => {:these => 'params'}
      end

      it "assigns the requested drive as @drive" do
        Drive.stub!(:find).and_return(mock_drive(:update_attributes => true))
        put :update, :id => "1"
        assigns[:drive].should equal(mock_drive)
      end

      it "redirects to the drive" do
        Drive.stub!(:find).and_return(mock_drive(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(drive_url(mock_drive))
      end
    end

    describe "with invalid params" do
      it "updates the requested drive" do
        Drive.should_receive(:find).with("37").and_return(mock_drive)
        mock_drive.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :drive => {:these => 'params'}
      end

      it "assigns the drive as @drive" do
        Drive.stub!(:find).and_return(mock_drive(:update_attributes => false))
        put :update, :id => "1"
        assigns[:drive].should equal(mock_drive)
      end

      it "re-renders the 'edit' template" do
        Drive.stub!(:find).and_return(mock_drive(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested drive" do
      Drive.should_receive(:find).with("37").and_return(mock_drive)
      mock_drive.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the drives list" do
      Drive.stub!(:find).and_return(mock_drive(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(drives_url)
    end
  end

end
