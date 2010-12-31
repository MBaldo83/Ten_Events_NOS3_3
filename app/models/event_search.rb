class EventSearch < ActiveRecord::Base


 def update_attributes_extra(attributes)
 
	if attributes[:myspaceSearch].to_i == 1
	
	attributes[:eventDateCSS] = ".entryDate"
	attributes[:eventLocationCSS] = "#module9 a"
	attributes[:descriptionCSS] = "#module9 p"
	
	end
 
	self.attributes = attributes
	self.save
 
 end



end
