class EventSearch < ActiveRecord::Base


 def update_attributes_extra(attributes)
 
	if attributes[:myspaceSearch].to_i == 1
	
	attributes[:eventDateCSS] = ".entryDate"
	attributes[:eventLocationCSS] = ".summary"
	attributes[:descriptionCSS] = ".locality"
	attributes[:eventTimeCSS] = ".dtstart"
	
	end
 
	self.attributes = attributes
	self.save
 
 end



end
