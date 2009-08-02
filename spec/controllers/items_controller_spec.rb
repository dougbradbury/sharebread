require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemsController do

  def mock_item(stubs={})
    @mock_item ||= mock_model(Item, stubs)
  end

  def mock_drive(stubs={})
    @mock_drive ||= mock_model(Drive, stubs)
  end
  
  before(:each) do
  end

  describe "GET index" do
    it "assigns all item as @item" do
      mock_drive(:items =>[mock_item])
      Drive.stub!(:find_by_id).with(mock_drive.id.to_s).and_return(mock_drive)          

      get :index, :drive_id => mock_drive.id

      assigns[:items].should == [mock_item]
    end
  end

  describe "GET new" do
    it "assigns a new item as @item" do
      Drive.stub!(:find_by_id).with(mock_drive.id.to_s).and_return(mock_drive)    
      Item.stub!(:new).and_return(mock_item)
      mock_item.should_receive(:drive=).with(mock_drive)

      get :new, :drive_id => mock_drive.id

      assigns[:item].should equal(mock_item)      
      assigns[:drive].should equal(mock_drive)      
    end
  end

  describe "GET edit" do
    it "assigns the requested item as @item" do
      Item.stub!(:find).with("37").and_return(mock_item(:drive => mock_drive))
      get :edit, :id => "37"
      assigns[:item].should equal(mock_item)
      assigns[:drive].should equal(mock_drive)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      before(:each) do
        @items = mock("items", :build => mock_item(:save => true))
        mock_drive(:items => @items)
        Drive.stub!(:find_by_id).with(mock_drive.id.to_s).and_return(mock_drive)          
      end
      
      it "assigns a newly created item as @item" do
        @items.should_receive(:build).with({'these' => 'params'}).and_return(mock_item)
              
        post :create, :item => {:these => 'params'}, :drive_id => mock_drive.id
        assigns[:item].should equal(mock_item)
      end

      it "redirects to the created item" do
        post :create, :item => {}, :drive_id => mock_drive.id
        response.should redirect_to(drive_items_url(mock_drive))
      end
    end

    describe "with invalid params" do
      before(:each) do
        @items = mock("items", :build => mock_item(:save => false))
        mock_drive(:items => @items)
        Drive.stub!(:find_by_id).with(mock_drive.id.to_s).and_return(mock_drive)          
      end
      
      it "assigns a newly created but unsaved item as @item" do
        post :create, :item => {:these => 'params'}, :drive_id => mock_drive.id
        assigns[:item].should equal(mock_item)
      end

      it "re-renders the 'new' template" do
        post :create, :item => {}, :drive_id => mock_drive.id
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested item" do
        Item.should_receive(:find).with("37").and_return(mock_item(:drive => mock_drive))        
        mock_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item => {:these => 'params'}
      end

      it "assigns the requested item as @item" do
        Item.stub!(:find).and_return(mock_item(:update_attributes => true, :drive => mock_drive))
        put :update, :id => "1"
        assigns[:item].should equal(mock_item)
      end

      it "redirects to the item" do
        Item.stub!(:find).and_return(mock_item(:update_attributes => true, :drive => mock_drive))
        put :update, :id => "1"
        response.should redirect_to(drive_items_url(mock_drive))
      end
    end

    describe "with invalid params" do
      it "updates the requested item" do
        Item.should_receive(:find).with("37").and_return(mock_item(:drive => mock_drive))
        mock_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item => {:these => 'params'}
      end

      it "assigns the item as @item" do
        Item.stub!(:find).and_return(mock_item(:update_attributes => false, :drive => mock_drive))
        put :update, :id => "1"
        assigns[:item].should equal(mock_item)
        assigns[:drive].should equal(mock_drive)
      end

      it "re-renders the 'edit' template" do
        Item.stub!(:find).and_return(mock_item(:update_attributes => false, :drive => mock_drive))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested item" do
      Item.should_receive(:find).with("37").and_return(mock_item(:drive => mock_drive))
      mock_item.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the item list" do
      Item.stub!(:find).and_return(mock_item(:destroy => true, :drive => mock_drive))
      delete :destroy, :id => "1"
      response.should redirect_to(drive_items_url(mock_drive))
    end
  end

end
