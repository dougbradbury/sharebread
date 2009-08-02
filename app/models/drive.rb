class Drive < ActiveRecord::Base
  belongs_to :organizer, :class_name => "Person"
  has_many :items
  
  def self.templates
    Drive.find_all_by_template(true)
  end
  
  
  def organizer_name=(name)
    build_organizer unless self.organizer
    self.organizer.name = name
  end
  
  def organizer_email=(email)
    find_or_build_organizer(email)
    self.organizer.email = email
  end
  
  def organizer_name
    self.organizer.nil? ? "" : self.organizer.name
  end
  
  def organizer_email
    self.organizer.nil? ? "" : self.organizer.email
  end  
  
  def amalgamate(drive)
    drive.items.each do |item|
      self.items << Item.new(:description => item.description, :needed => item.needed)
    end
  end
  
  
  private
  
  def find_or_build_organizer(email)
    found_organizer = Person.find_by_email(email)
    
    if (found_organizer)
      self.organizer = found_organizer
    elsif self.organizer.nil?
      build_organizer
    end
  end
  
  
end
