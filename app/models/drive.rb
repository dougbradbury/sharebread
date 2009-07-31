class Drive < ActiveRecord::Base
  belongs_to :organizer, :class_name => "Person"
  
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
