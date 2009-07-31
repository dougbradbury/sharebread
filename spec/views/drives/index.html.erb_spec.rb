require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/drives/index.html.erb" do
  include DrivesHelper

  before(:each) do
    assigns[:drives] = [
      stub_model(Drive),
      stub_model(Drive)
    ]
  end

  it "renders a list of drives" do
    render
  end
end
