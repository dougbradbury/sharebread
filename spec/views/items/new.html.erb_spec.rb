require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/items/new.html.erb" do
  include ItemsHelper

  before(:each) do
    assigns[:drive] = @drive = stub_model(Drive, :name => "who Drive")
    assigns[:item] = stub_model(Item, :drive => @drive, :new_record? => true)
  end

  it "renders new items form" do
    render

    response.should have_tag("form[action=?][method=post]", drive_items_path(@drive)) do
    end
  end
end
