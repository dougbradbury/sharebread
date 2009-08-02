require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Drive do
  before(:each) do
    Drive.destroy_all
    Person.destroy_all
    @valid_attributes = {
      
    }
    @drive = Drive.create!(@valid_attributes)
  end
  
  it "should have organizers info" do
    @drive = Drive.create!(@valid_attributes)
    @drive.organizer_name = "Doug Bradbury"
    @drive.organizer_email = "doug@example.com"

    @drive.organizer.should_not be_nil
    @drive.organizer.email.should == "doug@example.com"
    @drive.organizer.name.should == "Doug Bradbury"
    @drive.organizer_email.should == "doug@example.com"
    @drive.organizer_name.should == "Doug Bradbury"
    
    @drive.save!
    @drive.reload
    @drive.organizer.should_not be_nil
    @drive.organizer.email.should == "doug@example.com"
    @drive.organizer.name.should == "Doug Bradbury"    
    Person.find(:all).size.should == 1
  end
  
  it "should have blank organizer info if one hasn't been created yet" do
    @drive.organizer_email.should == ""
    @drive.organizer_name.should == ""    
  end
  
  it "should find existing person by email" do
    person = Person.create!(:name => "Gary Larson", :email => "gary@farside.com")
    @drive.organizer_email = "gary@farside.com"
    @drive.organizer.id.should == person.id
  end
  
  it "should replace the organizer with the one found by email" do
    person = Person.create!(:name => "Gary Larson", :email => "gary@farside.com")
    @drive.organizer_name = "Joe Quigley"
    @drive.organizer_email = "gary@farside.com"
    @drive.organizer.id.should == person.id    
    @drive.organizer.name.should == "Gary Larson"
    Person.find(:all).size.should == 1
  end
  
  it "should add an item" do
    @drive.items << item = Item.create(:description => "Silverware Set", :needed => 1)
    @drive.items.size.should == 1
    item.drive.id.should == @drive.id
  end
  
  it "should amalgamate a drive" do
    @drive.items << item = Item.create(:description => "Silverware Set", :needed => 1, :collected => 1)
    new_drive = Drive.create!(:name => "another drive")
    new_drive.amalgamate(@drive)
    new_drive.items.size.should == 1
    new_drive.items[0].should_not == item
    new_drive.items[0].description.should == "Silverware Set"
    new_drive.items[0].needed.should == 1
    new_drive.items[0].collected.should == 0
  end
  
  it "should have template drives" do
    @drive.template = true
    @drive.save!
    Drive.templates.size.should == 1
    Drive.templates[0].should == @drive
  end
  
end
