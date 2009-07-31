require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DrivesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "drives", :action => "index").should == "/drives"
    end

    it "maps #new" do
      route_for(:controller => "drives", :action => "new").should == "/drives/new"
    end

    it "maps #show" do
      route_for(:controller => "drives", :action => "show", :id => "1").should == "/drives/1"
    end

    it "maps #edit" do
      route_for(:controller => "drives", :action => "edit", :id => "1").should == "/drives/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "drives", :action => "create").should == {:path => "/drives", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "drives", :action => "update", :id => "1").should == {:path =>"/drives/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "drives", :action => "destroy", :id => "1").should == {:path =>"/drives/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/drives").should == {:controller => "drives", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/drives/new").should == {:controller => "drives", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/drives").should == {:controller => "drives", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/drives/1").should == {:controller => "drives", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/drives/1/edit").should == {:controller => "drives", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/drives/1").should == {:controller => "drives", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/drives/1").should == {:controller => "drives", :action => "destroy", :id => "1"}
    end
  end
end
