require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/drives/new.html.erb" do
  include DrivesHelper

  before(:each) do
    assigns[:drive] = stub_model(Drive,
      :new_record? => true
    )
  end

  it "renders new drive form" do
    render

    response.should have_tag("form[action=?][method=post]", drives_path) do
    end
  end
end
