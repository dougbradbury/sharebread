require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/items/index.html.erb" do
  include ItemsHelper

  before(:each) do
    assigns[:drive] = @drive = stub_model(Drive, :name => "who Drive")
    assigns[:items] = [
      stub_model(Item, :drive => @drive),
      stub_model(Item, :drive => @drive)
    ]
  end

  it "renders a list of items" do
    render
  end
end
