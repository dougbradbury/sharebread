require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/drives/show.html.erb" do
  include DrivesHelper
  before(:each) do
    assigns[:drive] = @drive = stub_model(Drive, :name => "", :info => "", :organizer => stub_model(Person, :name => "", :email => ""))
  end

  it "renders attributes in <p>" do
    render
  end
end
