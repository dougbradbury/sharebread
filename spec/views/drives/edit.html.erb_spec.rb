require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/drives/edit.html.erb" do
  include DrivesHelper

  before(:each) do
    assigns[:drive] = @drive = stub_model(Drive,
      :new_record? => false
    )
  end

  it "renders the edit drive form" do
    render

    response.should have_tag("form[action=#{drive_path(@drive)}][method=post]") do
    end
  end
end
